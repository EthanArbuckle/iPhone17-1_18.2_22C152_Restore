@interface PIPosterSettlingEffectLoader
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_livePhotoKeyFrameTimeForResource:(SEL)a3;
+ (BOOL)_canLoadVideoAtURL:(id)a3;
+ (BOOL)adjustCropRect:(CGRect *)a3 forEditedLivePhotoResource:(id)a4 error:(id *)a5;
+ (BOOL)adjustCropRect:(CGRect)a3 outputRect:(CGRect *)a4 outputExtent:(CGRect *)a5 forComposition:(id)a6 applyOrientation:(BOOL)a7 error:(id *)a8;
+ (BOOL)canHandleEditedLivePhotoResource:(id)a3 error:(id *)a4;
+ (BOOL)extractCropRect:(CGRect *)a3 fromStabilizationResultAttributes:(id)a4 error:(id *)a5;
+ (CGRect)effectiveCropRect:(CGRect)a3 forResource:(id)a4 error:(id *)a5;
+ (id)_resolveOptions:(id)a3 forResource:(id)a4;
+ (id)adjustedCompositionForResource:(id)a3 videoURL:(id)a4 cropRect:(CGRect)a5 error:(id *)a6;
+ (id)originalCompositionForResource:(id)a3 error:(id *)a4;
+ (id)temporaryAdjustedVideoURLForURL:(id)a3;
+ (id)temporaryDirectory;
+ (int)loadCropRectWithResource:(id)a3 options:(id)a4 completion:(id)a5;
+ (int)loadVideoWithResource:(id)a3 options:(id)a4 completion:(id)a5;
+ (unint64_t)_gatingFlagsFromMADStatus:(id)a3;
+ (void)adjustVideo:(id)a3 cropRect:(CGRect)a4 forResource:(id)a5 completion:(id)a6;
+ (void)cancelRequest:(int)a3;
@end

@implementation PIPosterSettlingEffectLoader

+ (id)adjustedCompositionForResource:(id)a3 videoURL:(id)a4 cropRect:(CGRect)a5 error:(id *)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (!v12)
  {
    v29 = NUAssertLogger_8475();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v33 = NUAssertLogger_8475();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v47 = dispatch_get_specific(*v31);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v31 = [v48 callStackSymbols];
        v50 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v64 = (const void **)v47;
        __int16 v65 = 2114;
        v66 = v50;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v34)
    {
      v35 = [MEMORY[0x1E4F29060] callStackSymbols];
      v31 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v64 = v31;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v39 = _NUAssertFailHandler();
    goto LABEL_27;
  }
  v14 = v13;
  if (!v13)
  {
    v36 = NUAssertLogger_8475();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoURL != nil");
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v33 = NUAssertLogger_8475();
    int v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        v40 = [MEMORY[0x1E4F29060] callStackSymbols];
        v31 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v64 = v31;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_29:

      int v44 = _NUAssertFailHandler();
      goto LABEL_30;
    }
LABEL_27:
    if (v39)
    {
      v51 = dispatch_get_specific(*v31);
      v52 = (void *)MEMORY[0x1E4F29060];
      id v53 = v51;
      v31 = [v52 callStackSymbols];
      v54 = [v31 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v64 = (const void **)v51;
      __int16 v65 = 2114;
      v66 = v54;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_29;
  }
  v15 = [v12 adjustmentData];

  if (!v15)
  {
    v41 = NUAssertLogger_8475();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource.adjustmentData != nil");
      v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v31 = (const void **)MEMORY[0x1E4F7A308];
    v43 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v33 = NUAssertLogger_8475();
    int v44 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v43)
    {
      if (v44)
      {
        v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v64 = v46;
        _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_32;
    }
LABEL_30:
    if (v44)
    {
      v55 = dispatch_get_specific(*v31);
      v56 = (void *)MEMORY[0x1E4F29060];
      id v57 = v55;
      v58 = [v56 callStackSymbols];
      v59 = [v58 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v64 = (const void **)v55;
      __int16 v65 = 2114;
      v66 = v59;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_32:

    _NUAssertFailHandler();
  }
  v16 = [v12 adjustmentData];
  v17 = [v12 adjustmentFormat];
  v18 = [v12 adjustmentVersion];
  v19 = +[PICompositionSerializer deserializeCompositionFromData:v16 formatIdentifier:v17 formatVersion:v18 error:a6];

  if (v19)
  {
    v20 = [v12 imageFileURL];
    v21 = [v12 fileType];
    v22 = +[PIPhotoEditHelper imageSourceWithURL:v20 type:v21 useEmbeddedPreview:0];

    v23 = +[PIPhotoEditHelper videoSourceWithURL:v14];
    v61 = @"appliedCropRect";
    *(CGFloat *)v60 = x;
    *(CGFloat *)&v60[1] = y;
    *(CGFloat *)&v60[2] = width;
    *(CGFloat *)&v60[3] = height;
    v24 = [MEMORY[0x1E4F29238] valueWithBytes:v60 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v62 = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v26 = [v23 definition];
    [v26 setSourceOptions:v25];

    v27 = +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:v22 videoSource:v23];
    [v19 setObject:v27 forKeyedSubscript:@"source"];
    [v19 setMediaType:3];
  }
  return v19;
}

+ (id)originalCompositionForResource:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v18 = NUAssertLogger_8475();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource != nil");
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v19;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_8475();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        v31 = dispatch_get_specific(*v20);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v20 = [v32 callStackSymbols];
        BOOL v34 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = (const void **)v31;
        __int16 v42 = 2114;
        v43 = v34;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v20;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v28 = _NUAssertFailHandler();
    goto LABEL_21;
  }
  v6 = v5;
  if ([v5 type] != 6)
  {
    v25 = NUAssertLogger_8475();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource.type == PFParallaxAssetResourceTypeLiveOriginal");
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v20 = (const void **)MEMORY[0x1E4F7A308];
    v27 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v22 = NUAssertLogger_8475();
    int v28 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!v27)
    {
      if (v28)
      {
        v29 = [MEMORY[0x1E4F29060] callStackSymbols];
        v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v41 = v30;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_21:
    if (v28)
    {
      v35 = dispatch_get_specific(*v20);
      v36 = (void *)MEMORY[0x1E4F29060];
      id v37 = v35;
      v38 = [v36 callStackSymbols];
      int v39 = [v38 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = (const void **)v35;
      __int16 v42 = 2114;
      v43 = v39;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_23:

    _NUAssertFailHandler();
  }
  v7 = [v6 adjustmentData];
  v8 = [v6 adjustmentFormat];
  v9 = [v6 adjustmentVersion];
  v10 = +[PICompositionSerializer deserializeCompositionFromData:v7 formatIdentifier:v8 formatVersion:v9 error:a4];

  if (v10)
  {
    v11 = [v6 imageFileURL];
    id v12 = [v6 fileType];
    id v13 = +[PIPhotoEditHelper imageSourceWithURL:v11 type:v12 useEmbeddedPreview:0];

    v14 = [v6 videoFileURL];
    v15 = +[PIPhotoEditHelper videoSourceWithURL:v14];

    v16 = +[PIPhotoEditHelper livePhotoSourceWithPhotoSource:v13 videoSource:v15];
    [v10 setObject:v16 forKeyedSubscript:@"source"];
    [v10 setMediaType:3];
  }
  return v10;
}

+ (id)temporaryAdjustedVideoURLForURL:(id)a3
{
  v4 = [a3 lastPathComponent];
  id v5 = [@"adj-" stringByAppendingString:v4];

  v6 = [a1 temporaryDirectory];
  v7 = [v6 URLByAppendingPathComponent:v5];

  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 removeItemAtURL:v7 error:0];

  return v7;
}

+ (id)temporaryDirectory
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  id v5 = [v4 bundleIdentifier];

  v6 = [v3 temporaryDirectory];
  v7 = [v6 URLByAppendingPathComponent:v5];

  [v3 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];
  return v7;
}

+ (void)adjustVideo:(id)a3 cropRect:(CGRect)a4 forResource:(id)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  v15 = (void (**)(id, void, id))a6;
  id v55 = 0;
  objc_msgSend(a1, "effectiveCropRect:forResource:error:", v14, &v55, x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  id v24 = v55;
  v56.origin.double x = v17;
  v56.origin.double y = v19;
  v56.size.double width = v21;
  v56.size.double height = v23;
  if (CGRectIsNull(v56))
  {
    v15[2](v15, 0, v24);
  }
  else
  {
    id v54 = 0;
    v25 = objc_msgSend(a1, "adjustedCompositionForResource:videoURL:cropRect:error:", v14, v13, &v54, v17, v19, v21, v23);
    id v26 = v54;

    if (v25)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      memset(v51, 0, sizeof(v51));
      id v50 = 0;
      char v27 = objc_msgSend(a1, "adjustCropRect:outputRect:outputExtent:forComposition:applyOrientation:error:", v51, &v52, v25, 0, &v50, x, y, width, height);
      id v28 = v50;

      if (v27)
      {
        long long v48 = 0u;
        long long v49 = 0u;
        NURectDenormalize();
        NUPixelRectFromCGRect();
        long long v46 = 0u;
        long long v47 = 0u;
        NUPixelRectFromCGRect();
        id v29 = +[PIPhotoEditHelper newCompositionControllerWithComposition:v25];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke;
        v39[3] = &__block_descriptor_128_e36_v16__0__PICropAdjustmentController_8l;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = v52;
        long long v43 = v53;
        long long v44 = 0u;
        long long v45 = 0u;
        [v29 modifyAdjustmentWithKey:@"cropStraighten" modificationBlock:v39];
        v30 = [a1 temporaryAdjustedVideoURLForURL:v13];
        id v31 = objc_alloc(MEMORY[0x1E4F7A6F0]);
        v32 = [v29 composition];
        id v33 = (void *)[v31 initWithComposition:v32 destinationURL:v30];

        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke_2;
        v36[3] = &unk_1E5D81798;
        id v37 = v30;
        v38 = v15;
        id v34 = v30;
        [v33 submit:v36];
      }
      else
      {
        uint64_t v35 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to adjust stabilization crop rect" object:v14 underlyingError:v28];

        v15[2](v15, 0, (id)v35);
        id v28 = (id)v35;
      }
      id v26 = v28;
    }
    else
    {
      v15[2](v15, 0, v26);
    }

    id v24 = v26;
  }
}

void __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  [v4 cropRect];
  uint64_t v6 = (uint64_t)v5;
  [v4 cropRect];
  uint64_t v8 = (uint64_t)v7;
  [v4 cropRect];
  uint64_t v10 = (uint64_t)v9;
  [v4 cropRect];
  specific = (void *)(uint64_t)v11;
  *(void *)buf = v6;
  *(void *)&buf[8] = v8;
  *(void *)&buf[16] = v10;
  *(void *)&buf[24] = (uint64_t)v11;
  if (NUPixelRectIsEmpty())
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    specific = *(void **)(a1 + 56);
  }
  if ((NUPixelSizeEqualToSize() & 1) == 0)
  {
    double v16 = NUAssertLogger_8475();
    uint64_t v6 = 0x1E4F29000uLL;
    v15 = &unk_1A980A000;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v17 = NSString;
      double v18 = (void *)MEMORY[0x1E4F29238];
      [v4 cropRect];
      v79[0] = v19;
      v79[1] = v20;
      v79[2] = v21;
      v79[3] = v22;
      double v23 = [v18 valueWithBytes:v79 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      long long v24 = *(_OWORD *)(a1 + 80);
      v78[0] = *(_OWORD *)(a1 + 64);
      v78[1] = v24;
      [MEMORY[0x1E4F29238] valueWithBytes:v78 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      v25 = [v17 stringWithFormat:@"Invalid current crop rect: %@ extent: %@", v23, v2];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v26 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    char v27 = NUAssertLogger_8475();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        specific = dispatch_get_specific(*v26);
        long long v47 = (void *)MEMORY[0x1E4F29060];
        id v2 = specific;
        id v26 = [v47 callStackSymbols];
        v15 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = specific;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      id v26 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    long long v48 = (void *)MEMORY[0x1E4F29238];
    [v4 cropRect];
    v77[0] = v49;
    v77[1] = v50;
    v77[2] = v51;
    v77[3] = v52;
    long long v43 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
    uint64_t v10 = [v48 valueWithBytes:v77 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    long long v53 = *(_OWORD *)(a1 + 80);
    v76[0] = *(_OWORD *)(a1 + 64);
    v76[1] = v53;
    [MEMORY[0x1E4F29238] valueWithBytes:v76 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    objc_claimAutoreleasedReturnValue();
    int v44 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)(a1 + 96);
  uint64_t v14 = *(void *)(a1 + 104);
  long long v75 = *(_OWORD *)(a1 + 112);
  v15 = (void *)(v13 + v6);
  id v2 = (id)(v14 + v8);
  v74[4] = v6;
  v74[5] = v8;
  v74[6] = v10;
  v74[7] = specific;
  NUPixelRectIntersection();
  *(void *)buf = v15;
  *(void *)&buf[8] = v2;
  *(_OWORD *)&buf[16] = v75;
  if ((NUPixelRectEqualToRect() & 1) == 0)
  {
    log = NUAssertLogger_8475();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v67 = NSString;
      id v29 = (void *)MEMORY[0x1E4F29238];
      *(void *)buf = v15;
      *(void *)&buf[8] = v2;
      *(_OWORD *)&buf[16] = v75;
      NUPixelRectToCGRect();
      v74[0] = v30;
      v74[1] = v31;
      v74[2] = v32;
      v74[3] = v33;
      id v34 = [v29 valueWithBytes:v74 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      uint64_t v35 = (void *)MEMORY[0x1E4F29238];
      *(void *)buf = v6;
      *(void *)&buf[8] = v8;
      *(void *)&buf[16] = v10;
      *(void *)&buf[24] = specific;
      NUPixelRectToCGRect();
      v73[0] = v36;
      v73[1] = v37;
      v73[2] = v38;
      v73[3] = v39;
      long long v40 = [v35 valueWithBytes:v73 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      long long v41 = [v67 stringWithFormat:@"Invalid adjusted crop rect: %@, current: %@", v34, v40];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_error_impl(&dword_1A9680000, log, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v26 = (const void **)MEMORY[0x1E4F7A308];
    long long v42 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    long long v43 = NUAssertLogger_8475();
    int v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (!v42)
    {
      if (v44)
      {
        long long v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        long long v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_19:
    if (v44)
    {
      id v54 = dispatch_get_specific(*v26);
      id v55 = (void *)MEMORY[0x1E4F29060];
      os_log_t loga = v54;
      v68 = [v55 callStackSymbols];
      CGRect v56 = [v68 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v56;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_21:

    id v57 = (void *)MEMORY[0x1E4F29238];
    *(void *)buf = v15;
    *(void *)&buf[8] = v2;
    *(_OWORD *)&buf[16] = v75;
    NUPixelRectToCGRect();
    v72[0] = v58;
    v72[1] = v59;
    v72[2] = v60;
    v72[3] = v61;
    [v57 valueWithBytes:v72 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x1E4F29238];
    *(void *)buf = v6;
    *(void *)&buf[8] = v8;
    *(void *)&buf[16] = v10;
    *(void *)&buf[24] = specific;
    NUPixelRectToCGRect();
    v71[0] = v63;
    v71[1] = v64;
    v71[2] = v65;
    v71[3] = v66;
    [v62 valueWithBytes:v71 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
  }
  *(void *)buf = v15;
  *(void *)&buf[8] = v2;
  *(_OWORD *)&buf[16] = v75;
  NUPixelRectToCGRect();
  objc_msgSend(v4, "setCropRect:");
  [v4 setEnabled:1];
}

void __76__PIPosterSettlingEffectLoader_adjustVideo_cropRect_forResource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = 0;
  v3 = [a2 result:&v7];
  id v4 = v7;
  if (v3) {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v4);
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v6 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

+ (CGRect)effectiveCropRect:(CGRect)a3 forResource:(id)a4 error:(id *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v49[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  if (!a5)
  {
    uint64_t v33 = NUAssertLogger_8475();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v35 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v37 = NUAssertLogger_8475();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v38)
      {
        long long v41 = dispatch_get_specific(*v35);
        long long v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        int v44 = [v42 callStackSymbols];
        long long v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v45;
        _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v38)
    {
      uint64_t v39 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v40 = [v39 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_error_impl(&dword_1A9680000, v37, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v12 = v11;
  id v47 = 0;
  uint64_t v13 = [a1 originalCompositionForResource:v11 error:&v47];
  id v14 = v47;
  if (v13)
  {
    id v15 = +[PIPhotoEditHelper newCompositionControllerWithComposition:v13];
    double v16 = [v15 livePhotoKeyFrameAdjustmentController];
    if (v16)
    {
      double v17 = (void *)[objc_alloc(MEMORY[0x1E4F7A700]) initWithComposition:v13];
      double v18 = +[PIPipelineFilters noGeometryFilter];
      v49[0] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
      [v17 setPipelineFilters:v19];

      id v46 = 0;
      uint64_t v20 = [v17 submitSynchronous:&v46];
      id v21 = v46;

      uint64_t v22 = [v20 properties];

      if (v22)
      {
        memset(buf, 0, sizeof(buf));
        [v22 cleanAperture];
        [v22 size];
        NUPixelRectNormalize();
        double x = x - v26;
        double v27 = 0.0;
        double v28 = 0.0;
        if (v24 != 0.0)
        {
          double x = x / v24;
          double v28 = width / v24;
        }
        double y = y - v23;
        if (v25 != 0.0)
        {
          double y = y / v25;
          double v27 = height / v25;
        }
      }
      else
      {
        *a5 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get video properties" object:v13 underlyingError:v21];
        double x = *MEMORY[0x1E4F1DB20];
        double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }

      id v14 = v21;
    }
    else
    {
      double v28 = width;
      double v27 = height;
    }
  }
  else
  {
    *a5 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load original composition for resource" object:v12 underlyingError:v14];
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v29 = x;
  double v30 = y;
  double v31 = v28;
  double v32 = v27;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

+ (BOOL)adjustCropRect:(CGRect)a3 outputRect:(CGRect *)a4 outputExtent:(CGRect *)a5 forComposition:(id)a6 applyOrientation:(BOOL)a7 error:(id *)a8
{
  BOOL v13 = a7;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v20 = buf;
  v113[1] = *MEMORY[0x1E4F143B8];
  id v21 = a6;
  if (!a4)
  {
    v68 = NUAssertLogger_8475();
    double v27 = "outCropRect != NULL";
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outCropRect != NULL");
      v69 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v69;
      _os_log_error_impl(&dword_1A9680000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v22 = NUAssertLogger_8475();
    BOOL v70 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v70)
      {
        specific = dispatch_get_specific(*v28);
        v74 = (void *)MEMORY[0x1E4F29060];
        id v75 = specific;
        double v28 = [v74 callStackSymbols];
        a4 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v105 = (const void **)specific;
        __int16 v106 = 2114;
        v107 = a4;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v70)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      double v28 = [specific componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v105 = v28;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v73 = _NUAssertFailHandler();
    goto LABEL_36;
  }
  uint64_t v22 = v21;
  if (!v21)
  {
    v71 = NUAssertLogger_8475();
    double v27 = "composition != nil";
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      v72 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v105 = v72;
      _os_log_error_impl(&dword_1A9680000, v71, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v28 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v22 = NUAssertLogger_8475();
    int v73 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v73)
      {
        specific = [MEMORY[0x1E4F29060] callStackSymbols];
        double v28 = [specific componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v105 = v28;
        _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_38:

      _NUAssertFailHandler();
      goto LABEL_39;
    }
LABEL_36:
    if (v73)
    {
      specific = dispatch_get_specific(*v28);
      v76 = (void *)MEMORY[0x1E4F29060];
      id v77 = specific;
      double v28 = [v76 callStackSymbols];
      a4 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v105 = (const void **)specific;
      __int16 v106 = 2114;
      v107 = a4;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_38;
  }
  BOOL v96 = v13;
  specific = (void *)[objc_alloc(MEMORY[0x1E4F7A498]) initWithComposition:v21];
  double v24 = +[PIPipelineFilters noOrientationFilter];
  v113[0] = v24;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:1];
  [specific setPipelineFilters:v25];

  id v103 = 0;
  double v26 = [specific submitSynchronous:&v103];
  double v27 = (char *)v103;
  double v28 = [v26 geometry];

  if (v28)
  {
    v95 = a8;
    double v29 = +[PIPipelineFilters noGeometryFilter];
    v112 = v29;
    double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
    [specific setPipelineFilters:v30];

    id v102 = 0;
    double v31 = [specific submitSynchronous:&v102];
    double v32 = (char *)v102;

    uint64_t v8 = [v31 geometry];

    if (!v8)
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get input image geometry" object:v22 underlyingError:v32];
      LOBYTE(v55) = 0;
      id *v95 = (id)objc_claimAutoreleasedReturnValue();
      double v27 = v32;
LABEL_21:

      goto LABEL_22;
    }
    double v88 = x;
    double v90 = y;
    double v92 = width;
    double v94 = height;
    [v8 extent];
    NUPixelRectToCGRect();
    double v10 = v33;
    double y = v34;
    double x = v35;
    double v11 = v36;
    [v28 extent];
    NUPixelRectToCGRect();
    double v38 = v37;
    double v9 = v39;
    double v41 = v40;
    double v43 = v42;
    id v101 = 0;
    uint64_t v20 = [v28 transformWithSourceSpace:@"/pre-Geometry" destinationSpace:@"/pre-Orientation" error:&v101];
    double v27 = (char *)v101;

    if (!v20)
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get image geometry transform" object:v28 underlyingError:v27];
      LOBYTE(v55) = 0;
      id *v95 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    double v82 = y + v90 * v11;
    double v84 = v10 + v88 * x;
    double v78 = v94 * v11;
    double log = v92 * x;
    objc_msgSend(MEMORY[0x1E4F7A418], "adjustCropRect:inputExtent:geometryTransform:", v20, v38, v9, v41, v43);
    double v89 = v38;
    double v91 = v43;
    v115.origin.double x = v38;
    v115.origin.double y = v9;
    double v93 = v41;
    v115.size.CGFloat width = v41;
    v115.size.CGFloat height = v43;
    CGRectIntersection(v114, v115);
    NUPixelRectFromCGRect();
    NUPixelRectToCGRect();
    uint64_t v86 = v45;
    uint64_t v87 = v44;
    CGFloat width = v46;
    CGFloat height = v47;
    if (*MEMORY[0x1E4F7A750] == -1)
    {
LABEL_7:
      long long v48 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = (void *)MEMORY[0x1E4F29238];
        *(double *)v100 = v84;
        *(double *)&v100[1] = v82;
        *(double *)&v100[2] = log;
        *(double *)&v100[3] = v78;
        os_log_t loga = v48;
        v83 = a5;
        [v49 valueWithBytes:v100 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v79 = (const void **)objc_claimAutoreleasedReturnValue();
        *(double *)v99 = v10;
        *(double *)&v99[1] = y;
        *(double *)&v99[2] = x;
        *(double *)&v99[3] = v11;
        [MEMORY[0x1E4F29238] valueWithBytes:v99 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        uint64_t v50 = (CGRect *)objc_claimAutoreleasedReturnValue();
        v98[0] = v87;
        v98[1] = v86;
        *(CGFloat *)&v98[2] = width;
        *(CGFloat *)&v98[3] = height;
        [MEMORY[0x1E4F29238] valueWithBytes:v98 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        uint64_t v51 = v85 = v20;
        *(double *)v97 = v89;
        *(double *)&v97[1] = v9;
        *(double *)&v97[2] = v93;
        *(double *)&v97[3] = v91;
        uint64_t v52 = [MEMORY[0x1E4F29238] valueWithBytes:v97 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        *(_DWORD *)buf = 138413058;
        v105 = v79;
        __int16 v106 = 2112;
        v107 = v50;
        __int16 v108 = 2112;
        v109 = v51;
        __int16 v110 = 2112;
        v111 = v52;
        _os_log_impl(&dword_1A9680000, loga, OS_LOG_TYPE_DEFAULT, "Adjust FRC crop rect: %@ [%@], output rect: %@ [%@]", buf, 0x2Au);

        a5 = v83;
        uint64_t v20 = v85;
      }
      if (!v96)
      {
        CGFloat v62 = v91;
        CGFloat v60 = v93;
        CGFloat v57 = v89;
LABEL_16:
        NURectNormalize();
        a4->origin.double x = v63;
        a4->origin.double y = v64;
        a4->size.CGFloat width = v65;
        a4->size.CGFloat height = v66;
        if (a5)
        {
          a5->origin.double x = v57;
          a5->origin.double y = v9;
          LOBYTE(v55) = 1;
          a5->size.CGFloat width = v60;
          a5->size.CGFloat height = v62;
        }
        else
        {
          LOBYTE(v55) = 1;
        }
        goto LABEL_20;
      }
      id v53 = +[PIPhotoEditHelper newCompositionControllerWithComposition:v22];
      id v54 = [v53 orientationAdjustmentController];
      id v55 = v54;
      if (v54)
      {
        [v54 orientation];
        [v28 size];
        NUOrientationTransformRect();
        [v28 size];
        NUOrientationTransformRect();
        CGFloat v57 = v56;
        double v9 = v58;
        CGFloat v60 = v59;
        CGFloat v62 = v61;

        goto LABEL_16;
      }
      id *v95 = [MEMORY[0x1E4F7A438] failureError:@"Missing orientation adjustment" object:v22];

LABEL_20:
      goto LABEL_21;
    }
LABEL_39:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_8563);
    goto LABEL_7;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get output image geometry" object:v22 underlyingError:v27];
  LOBYTE(v55) = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return (char)v55;
}

+ (BOOL)adjustCropRect:(CGRect *)a3 forEditedLivePhotoResource:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!a3)
  {
    id v15 = NUAssertLogger_8475();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inoutCropRect != NULL");
      double v16 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      CGFloat v57 = v16;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_8475();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        double v38 = dispatch_get_specific(*v17);
        double v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        double v17 = [v39 callStackSymbols];
        double v41 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        CGFloat v57 = (const void **)v38;
        __int16 v58 = 2114;
        double v59 = v41;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      id v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v17 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      CGFloat v57 = v17;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v25 = _NUAssertFailHandler();
    goto LABEL_32;
  }
  double v9 = v8;
  if (!v8)
  {
    uint64_t v22 = NUAssertLogger_8475();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource != nil");
      double v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      CGFloat v57 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    double v24 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_8475();
    int v25 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v24)
    {
      if (v25)
      {
        double v26 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v17 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        CGFloat v57 = v17;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_34:

      int v30 = _NUAssertFailHandler();
      goto LABEL_35;
    }
LABEL_32:
    if (v25)
    {
      double v42 = dispatch_get_specific(*v17);
      double v43 = (void *)MEMORY[0x1E4F29060];
      id v44 = v42;
      double v17 = [v43 callStackSymbols];
      uint64_t v45 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      CGFloat v57 = (const void **)v42;
      __int16 v58 = 2114;
      double v59 = v45;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_34;
  }
  if ([v8 type] != 6)
  {
    double v27 = NUAssertLogger_8475();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource.type == PFParallaxAssetResourceTypeLiveOriginal");
      double v28 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      CGFloat v57 = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    double v29 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_8475();
    int v30 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v29)
    {
      if (v30)
      {
        double v31 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v17 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        CGFloat v57 = v17;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_37:

      int v35 = _NUAssertFailHandler();
      goto LABEL_38;
    }
LABEL_35:
    if (v30)
    {
      double v46 = dispatch_get_specific(*v17);
      double v47 = (void *)MEMORY[0x1E4F29060];
      id v48 = v46;
      double v17 = [v47 callStackSymbols];
      uint64_t v49 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      CGFloat v57 = (const void **)v46;
      __int16 v58 = 2114;
      double v59 = v49;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_37;
  }
  double v10 = [v9 adjustmentData];

  if (!v10)
  {
    double v32 = NUAssertLogger_8475();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "resource.adjustmentData != nil");
      double v33 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      CGFloat v57 = v33;
      _os_log_error_impl(&dword_1A9680000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v17 = (const void **)MEMORY[0x1E4F7A308];
    double v34 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v19 = NUAssertLogger_8475();
    int v35 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v34)
    {
      if (v35)
      {
        double v36 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        CGFloat v57 = v37;
        _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_40;
    }
LABEL_38:
    if (v35)
    {
      uint64_t v50 = dispatch_get_specific(*v17);
      uint64_t v51 = (void *)MEMORY[0x1E4F29060];
      id v52 = v50;
      id v53 = [v51 callStackSymbols];
      id v54 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      CGFloat v57 = (const void **)v50;
      __int16 v58 = 2114;
      double v59 = v54;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_40:

    _NUAssertFailHandler();
  }
  id v55 = 0;
  double v11 = [a1 originalCompositionForResource:v9 error:&v55];
  id v12 = v55;
  if (v11)
  {
    char v13 = objc_msgSend(a1, "adjustCropRect:outputRect:outputExtent:forComposition:applyOrientation:error:", a3, 0, v11, 1, a5, a3->origin.x, a3->origin.y, a3->size.width, a3->size.height);
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get original composition for live photo resource" object:v9 underlyingError:v12];
    char v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (BOOL)canHandleEditedLivePhotoResource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v18 = 0;
  id v7 = [a1 originalCompositionForResource:v6 error:&v18];
  id v8 = v18;
  if (v7)
  {
    double v9 = [[PICompositionController alloc] initWithComposition:v7];
    double v10 = [(PICompositionController *)v9 autoLoopAdjustmentController];
    char v11 = [v10 enabled];

    if (v11)
    {
      id v12 = @"AutoLoop adjustment is not supported";
    }
    else
    {
      id v14 = [(PICompositionController *)v9 portraitAdjustmentController];
      if ([v14 enabled])
      {
      }
      else
      {
        id v15 = [(PICompositionController *)v9 depthAdjustmentController];
        int v16 = [v15 enabled];

        if (!v16)
        {
          BOOL v13 = 1;
          goto LABEL_10;
        }
      }
      id v12 = @"Portrait and depth adjustments are not supported";
    }
    [MEMORY[0x1E4F7A438] unsupportedError:v12 object:v7];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to get original composition for live photo resource" object:v6 underlyingError:v8];
  BOOL v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

+ (void)cancelRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [getVCPMediaAnalysisServiceClass() sharedAnalysisService];
  [v4 cancelRequest:v3];
}

+ (BOOL)_canLoadVideoAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
  id v5 = (id)[MEMORY[0x1E4F16330] assetWithData:v4 contentType:*MEMORY[0x1E4F15AB0] options:MEMORY[0x1E4F1CC08]];

  return 1;
}

+ (int)loadVideoWithResource:(id)a3 options:(id)a4 completion:(id)a5
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void, uint64_t, uint64_t, uint64_t))a5;
  uint64_t v11 = [v8 imageFileURL];
  if (v11
    && (id v12 = (void *)v11,
        [v8 videoFileURL],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    id v14 = [v8 adjustmentData];

    if (v14)
    {
      uint64_t v41 = 0;
      if (([a1 canHandleEditedLivePhotoResource:v8 error:&v41] & 1) == 0)
      {
        v10[2](v10, 0, 1, 256, v41);
        goto LABEL_13;
      }
    }
    id v15 = +[PIGlobalSettings globalSettings];
    int v16 = [v15 disableMADForSettlingEffect];

    if (!v16)
    {
      int v30 = [a1 _resolveOptions:v9 forResource:v8];
      double v31 = [getVCPMediaAnalysisServiceClass() sharedAnalysisService];
      double v32 = [v8 imageFileURL];
      v42[0] = v32;
      double v33 = [v8 videoFileURL];
      v42[1] = v33;
      double v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke;
      v35[3] = &unk_1E5D7F910;
      id v36 = v8;
      double v38 = v10;
      id v39 = a1;
      id v37 = v9;
      int v28 = [v31 requestAnalysisTypes:0x4000000000 forAssetWithResourceURLs:v34 withOptions:v30 progressHandler:0 andCompletionHandler:v35];

      goto LABEL_14;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v18 = NSTemporaryDirectory();
    uint64_t v19 = (void *)[v17 initFileURLWithPath:v18 isDirectory:1];

    BOOL v20 = [v8 videoFileURL];
    id v21 = [v20 lastPathComponent];
    uint64_t v22 = [v19 URLByAppendingPathComponent:v21];

    double v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    double v24 = [v8 videoFileURL];
    id v40 = 0;
    int v25 = [v23 copyItemAtURL:v24 toURL:v22 error:&v40];
    id v26 = v40;

    if (v25)
    {
      if ([v9 isInteractiveRequest]) {
        uint64_t v27 = 3;
      }
      else {
        uint64_t v27 = 5;
      }
      ((void (**)(id, void *, uint64_t, uint64_t, uint64_t))v10)[2](v10, v22, v27, 0, 0);
    }
    else
    {
      v10[2](v10, 0, 1, 512, (uint64_t)v26);
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F7A438] missingError:@"Resource is missing image and/or video URLs" object:v8];
    v10[2](v10, 0, 1, 128, (uint64_t)v22);
  }

LABEL_13:
  int v28 = 0;
LABEL_14:

  return v28;
}

void __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = getMediaAnalysisResultsKey();
    id v8 = [v5 objectForKeyedSubscript:v7];

    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    id v9 = (void *)getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr;
    uint64_t v74 = getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr;
    if (!getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr)
    {
      *(void *)&long long v68 = MEMORY[0x1E4F143A8];
      *((void *)&v68 + 1) = 3221225472;
      *(void *)&long long v69 = __getMediaAnalysisSettlingEffectResultsKeySymbolLoc_block_invoke;
      *((void *)&v69 + 1) = &unk_1E5D81578;
      BOOL v70 = &v71;
      double v10 = MediaAnalysisLibrary();
      v72[3] = (uint64_t)dlsym(v10, "MediaAnalysisSettlingEffectResultsKey");
      getMediaAnalysisSettlingEffectResultsKeySymbolLoc_ptr = *(void *)(v70[1] + 24);
      id v9 = (void *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v9)
    {
      double v46 = [MEMORY[0x1E4F28B00] currentHandler];
      double v47 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisSettlingEffectResultsKey(void)"];
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"PIPosterSettlingEffectLoader.m", 41, @"%s", dlerror());
      goto LABEL_42;
    }
    uint64_t v11 = [v8 objectForKeyedSubscript:*v9];
    id v12 = [v11 firstObject];
    BOOL v13 = getMediaAnalysisResultAttributesKey();
    id v14 = [v12 objectForKeyedSubscript:v13];

    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    id v15 = (id *)getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr;
    uint64_t v74 = getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr;
    if (!getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr)
    {
      *(void *)&long long v68 = MEMORY[0x1E4F143A8];
      *((void *)&v68 + 1) = 3221225472;
      *(void *)&long long v69 = __getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_block_invoke;
      *((void *)&v69 + 1) = &unk_1E5D81578;
      BOOL v70 = &v71;
      int v16 = MediaAnalysisLibrary();
      v72[3] = (uint64_t)dlsym(v16, "MediaAnalysisResultSettlingEffectURLAttributeKey");
      getMediaAnalysisResultSettlingEffectURLAttributeKeySymbolLoc_ptr = *(void *)(v70[1] + 24);
      id v15 = (id *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v15)
    {
      double v46 = [MEMORY[0x1E4F28B00] currentHandler];
      double v47 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectURLAttributeKey(void)"];
      objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"PIPosterSettlingEffectLoader.m", 40, @"%s", dlerror());
      goto LABEL_42;
    }
    id v53 = v6;
    id v54 = v12;
    id v17 = *v15;
    id v18 = [v14 objectForKeyedSubscript:v17];

    uint64_t v19 = getMediaAnalysisResultSettlingEffectStatusAttributeKey();
    BOOL v20 = [v14 objectForKeyedSubscript:v19];

    uint64_t v64 = 0;
    CGFloat v65 = &v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = 0;
    uint64_t v67 = [a1[7] _gatingFlagsFromMADStatus:v20];
    id v55 = v8;
    if (!v18)
    {
      id v21 = [MEMORY[0x1E4F7A438] missingError:@"Missing settling effect video results" object:v8];
      v65[3] |= 0x200uLL;
      (*((void (**)(void))a1[6] + 2))();
LABEL_38:

      _Block_object_dispose(&v64, 8);
      id v6 = v53;
      goto LABEL_39;
    }
    id v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
    int v22 = [a1[5] isInteractiveRequest];
    uint64_t v23 = 5;
    if (v22) {
      uint64_t v23 = 3;
    }
    uint64_t v51 = v23;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    double v24 = (id *)getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr;
    uint64_t v74 = getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr;
    if (!getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr)
    {
      *(void *)&long long v68 = MEMORY[0x1E4F143A8];
      *((void *)&v68 + 1) = 3221225472;
      *(void *)&long long v69 = __getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_block_invoke;
      *((void *)&v69 + 1) = &unk_1E5D81578;
      BOOL v70 = &v71;
      int v25 = MediaAnalysisLibrary();
      id v26 = dlsym(v25, "MediaAnalysisResultSettlingEffectFRCRecommendationAttributeKey");
      *(void *)(v70[1] + 24) = v26;
      getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKeySymbolLoc_ptr = *(void *)(v70[1] + 24);
      double v24 = (id *)v72[3];
    }
    _Block_object_dispose(&v71, 8);
    if (!v24)
    {
      while (1)
      {
        double v46 = [MEMORY[0x1E4F28B00] currentHandler];
        double v47 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectFRCRecommendationAttributeKey(void)"];
        objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"PIPosterSettlingEffectLoader.m", 44, @"%s", dlerror());
LABEL_42:

        __break(1u);
      }
    }
    id v52 = v11;
    id v27 = *v24;
    int v28 = [v14 objectForKeyedSubscript:v27];

    if (v28)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v33 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid FRC Recommendation value" object:v28];
        v65[3] |= 0x200uLL;
        (*((void (**)(void))a1[6] + 2))();
        goto LABEL_36;
      }
      unint64_t v29 = [v28 integerValue];
      if (v29 < 5) {
        uint64_t v51 = qword_1A980BC48[v29];
      }
    }
    int v30 = [a1[4] adjustmentData];
    if (v30 && (int v31 = [a1[5] loadVideoStatusOnly], v30, !v31))
    {
      double v34 = getMediaAnalysisPathConstraintsStabilizationResultsKey();
      double v33 = [v55 objectForKeyedSubscript:v34];

      uint64_t v50 = [v33 firstObject];
      if (v50)
      {
        int v35 = getMediaAnalysisResultAttributesKey();
        uint64_t v36 = [v50 objectForKeyedSubscript:v35];

        id v37 = (void *)v36;
        if (v36)
        {
          long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
          long long v68 = *MEMORY[0x1E4F1DB20];
          long long v69 = v38;
          id v39 = a1[7];
          id v63 = 0;
          uint64_t v49 = (void *)v36;
          char v40 = [v39 extractCropRect:&v68 fromStabilizationResultAttributes:v36 error:&v63];
          id v41 = v63;
          if (v40)
          {
            id v48 = a1[7];
            id v42 = a1[4];
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke_2;
            v56[3] = &unk_1E5D7F8E8;
            id v57 = v42;
            uint64_t v60 = &v64;
            id v43 = a1[6];
            id v44 = a1[7];
            id v59 = v43;
            id v61 = v44;
            id v58 = v21;
            uint64_t v62 = v51;
            objc_msgSend(v48, "adjustVideo:cropRect:forResource:completion:", v58, v57, v56, v68, v69);
          }
          else
          {
            uint64_t v45 = objc_msgSend(MEMORY[0x1E4F7A438], "errorWithCode:reason:object:underlyingError:", 1, @"Failed to extract crop rect from stabilization result", v50);

            (*((void (**)(void))a1[6] + 2))();
            id v41 = (id)v45;
          }
          id v37 = v49;
        }
        else
        {
          id v41 = [MEMORY[0x1E4F7A438] missingError:@"Missing stabilized crop rect attributes" object:v5];
          (*((void (**)(void))a1[6] + 2))();
        }
      }
      else
      {
        id v37 = [MEMORY[0x1E4F7A438] missingError:@"Missing stabilized crop rect results" object:v5];
        (*((void (**)(void))a1[6] + 2))();
      }
    }
    else
    {
      if ([a1[7] _canLoadVideoAtURL:v21])
      {
        (*((void (**)(void))a1[6] + 2))();
LABEL_37:

        uint64_t v11 = v52;
        goto LABEL_38;
      }
      v65[3] |= 0x2000uLL;
      double v33 = [MEMORY[0x1E4F7A438] invalidError:@"Failed to load video asset from file" object:v21];
      (*((void (**)(void))a1[6] + 2))();
    }
LABEL_36:

    goto LABEL_37;
  }
  double v32 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to analyze asset for settling effect" object:a1[4] underlyingError:v6];
  (*((void (**)(void))a1[6] + 2))();

LABEL_39:
}

void __73__PIPosterSettlingEffectLoader_loadVideoWithResource_options_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    if ([*(id *)(a1 + 64) _canLoadVideoAtURL:*(void *)(a1 + 40)])
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x2000uLL;
      id v7 = [MEMORY[0x1E4F7A438] invalidError:@"Failed to load video asset from file" object:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to adjust video for edited live photo resource" object:*(void *)(a1 + 32) underlyingError:v5];

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x400uLL;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = (id)v6;
  }
}

+ (BOOL)extractCropRect:(CGRect *)a3 fromStabilizationResultAttributes:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    id v27 = NUAssertLogger_8475();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outCropRect != NULL");
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = v28;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);
    }
    a3 = (CGRect *)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v30 = NUAssertLogger_8475();
    int v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (specific) {
      goto LABEL_40;
    }
    if (v31)
    {
      double v32 = [MEMORY[0x1E4F29060] callStackSymbols];
      a3 = [v32 componentsJoinedByString:@"\n"];
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = a3;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&rect, 0xCu);
    }
    goto LABEL_42;
  }
  id v8 = v7;
  if (!v7)
  {
    double v33 = NUAssertLogger_8475();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      double v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "stabResultAttributes != nil");
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = v34;
      _os_log_error_impl(&dword_1A9680000, v33, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);
    }
    a3 = (CGRect *)MEMORY[0x1E4F7A308];
    int v35 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v30 = NUAssertLogger_8475();
    BOOL v36 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v35)
    {
      if (v36)
      {
        double v47 = dispatch_get_specific(*(const void **)&a3->origin.x);
        id v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        a3 = [v48 callStackSymbols];
        uint64_t v50 = [(CGRect *)a3 componentsJoinedByString:@"\n"];
        LODWORD(rect.origin.x) = 138543618;
        *(void *)((char *)&rect.origin.x + 4) = v47;
        WORD2(rect.origin.y) = 2114;
        *(void *)((char *)&rect.origin.y + 6) = v50;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);
      }
      goto LABEL_45;
    }
    if (v36)
    {
LABEL_32:
      id v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      a3 = [v37 componentsJoinedByString:@"\n"];
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = a3;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&rect, 0xCu);
    }
LABEL_45:

    int v31 = _NUAssertFailHandler();
    goto LABEL_39;
  }
  if (!a5)
  {
    long long v38 = NUAssertLogger_8475();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(rect.origin.x) = 138543362;
      *(void *)((char *)&rect.origin.x + 4) = v39;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&rect, 0xCu);
    }
    a3 = (CGRect *)MEMORY[0x1E4F7A308];
    char v40 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v30 = NUAssertLogger_8475();
    BOOL v41 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v41)
      {
        uint64_t v51 = dispatch_get_specific(*(const void **)&a3->origin.x);
        id v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        a3 = [v52 callStackSymbols];
        id v54 = [(CGRect *)a3 componentsJoinedByString:@"\n"];
        LODWORD(rect.origin.x) = 138543618;
        *(void *)((char *)&rect.origin.x + 4) = v51;
        WORD2(rect.origin.y) = 2114;
        *(void *)((char *)&rect.origin.y + 6) = v54;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);
      }
      goto LABEL_45;
    }
    if (v41) {
      goto LABEL_32;
    }
    goto LABEL_45;
  }
  size.double width = 0.0;
  *(void *)&size.double height = &size;
  uint64_t v56 = 0x2020000000;
  id v9 = (void *)getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr;
  uint64_t v57 = getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr)
  {
    *(void *)&rect.origin.double x = MEMORY[0x1E4F143A8];
    *(void *)&rect.origin.double y = 3221225472;
    *(void *)&rect.size.double width = __getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_block_invoke;
    *(void *)&rect.size.double height = &unk_1E5D81578;
    p_CGSize size = &size;
    double v10 = MediaAnalysisLibrary();
    uint64_t v11 = dlsym(v10, "MediaAnalysisResultsStabilizationCropAttributeKey");
    *(void *)(*(void *)&p_size->height + 24) = v11;
    getMediaAnalysisResultsStabilizationCropAttributeKeySymbolLoc_ptr = *(void *)(*(void *)&p_size->height + 24);
    id v9 = *(void **)(*(void *)&size.height + 24);
  }
  _Block_object_dispose(&size, 8);
  if (!v9)
  {
    int v30 = [MEMORY[0x1E4F28B00] currentHandler];
    id v42 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultsStabilizationCropAttributeKey(void)"];
    [v30 handleFailureInFunction:v42, @"PIPosterSettlingEffectLoader.m", 42, @"%s", dlerror() file lineNumber description];

    while (1)
    {
LABEL_39:
      __break(1u);
LABEL_40:
      if (v31)
      {
        id v43 = dispatch_get_specific(*(const void **)&a3->origin.x);
        id v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        a3 = [v44 callStackSymbols];
        double v46 = [(CGRect *)a3 componentsJoinedByString:@"\n"];
        LODWORD(rect.origin.x) = 138543618;
        *(void *)((char *)&rect.origin.x + 4) = v43;
        WORD2(rect.origin.y) = 2114;
        *(void *)((char *)&rect.origin.y + 6) = v46;
        _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&rect, 0x16u);
      }
LABEL_42:

      int v31 = _NUAssertFailHandler();
    }
  }
  id v12 = [v8 objectForKeyedSubscript:*v9];
  BOOL v13 = [v8 objectForKeyedSubscript:@"SourceSize"];
  CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  rect.CGSize size = v14;
  id v15 = v12;
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_18;
  }
  BOOL v16 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v15, &rect);

  if (!v16)
  {
LABEL_18:
    id v25 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid settling effect stabilization crop rect" object:v15];
LABEL_19:
    BOOL v24 = 0;
    *a5 = v25;
    goto LABEL_20;
  }
  CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
  id v17 = v13;
  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_22;
  }
  BOOL v18 = CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)v17, &size);

  if (!v18)
  {
LABEL_22:
    id v25 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid settling effect stabilization source size" object:v17];
    goto LABEL_19;
  }
  if (size.width >= size.height) {
    double width = size.width;
  }
  else {
    double width = size.height;
  }
  double v20 = width / size.height;
  double height = rect.size.height;
  CGFloat v22 = rect.origin.y * (width / size.height) + 0.5;
  CGFloat v23 = rect.size.width * (width / size.width);
  a3->origin.double x = rect.origin.x * (width / size.width) + 0.5;
  a3->origin.double y = v22;
  a3->size.double width = v23;
  a3->size.double height = v20 * height;
  BOOL v24 = 1;
LABEL_20:

  return v24;
}

+ (int)loadCropRectWithResource:(id)a3 options:(id)a4 completion:(id)a5
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, uint64_t, uint64_t, void, double, double, double, double))a5;
  uint64_t v11 = [v8 imageFileURL];
  if (v11
    && (id v12 = (void *)v11,
        [v8 videoFileURL],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    CGSize v14 = [v8 adjustmentData];

    if (v14)
    {
      uint64_t v36 = 0;
      if (([a1 canHandleEditedLivePhotoResource:v8 error:&v36] & 1) == 0)
      {
        v10[2](v10, 1, 256, v36, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
        goto LABEL_13;
      }
    }
    id v15 = +[PIGlobalSettings globalSettings];
    int v16 = [v15 disableMADForSettlingEffect];

    if (!v16)
    {
      BOOL v24 = [a1 _resolveOptions:v9 forResource:v8];
      id v25 = [getVCPMediaAnalysisServiceClass() sharedAnalysisService];
      id v26 = [v8 imageFileURL];
      v37[0] = v26;
      id v27 = [v8 videoFileURL];
      v37[1] = v27;
      int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke_2;
      v29[3] = &unk_1E5D7F8C0;
      id v30 = v8;
      int v31 = v10;
      id v32 = a1;
      int v22 = [v25 requestAnalysisTypes:0x10000000000 forAssetWithResourceURLs:v28 withOptions:v24 progressHandler:0 andCompletionHandler:v29];

      goto LABEL_14;
    }
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_8563);
    }
    id v17 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9680000, v17, OS_LOG_TYPE_DEFAULT, "MAD for settling effect is disabled", buf, 2u);
    }
    id v18 = +[PIPhotoEditHelper newComposition];
    uint64_t v19 = [v8 videoFileURL];
    double v20 = +[PIPhotoEditHelper videoSourceWithURL:v19];

    [v18 setObject:v20 forKeyedSubscript:@"source"];
    [v18 setMediaType:2];
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F7A700]) initWithComposition:v18];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke;
    v33[3] = &unk_1E5D81670;
    double v34 = v10;
    [v21 submit:v33];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F7A438] missingError:@"Resource is missing image and/or video URLs" object:v8];
    ((void (**)(id, uint64_t, uint64_t, id, double, double, double, double))v10)[2](v10, 1, 128, v18, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }

LABEL_13:
  int v22 = 0;
LABEL_14:

  return v22;
}

void __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v30 = 0;
  id v3 = [a2 result:&v30];
  id v4 = v30;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = [v3 properties];
    double v10 = v9;
    if (v9)
    {
      [v9 cleanAperture];
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
    }

    NUPixelRectToCGRect();
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = objc_msgSend(v3, "properties", v28, v29);
    [v19 size];
    NUPixelSizeToCGRect();
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    v5.n128_f64[0] = v12 - v21;
    v8.n128_u64[0] = 0;
    v7.n128_u64[0] = 0;
    if (v25 != 0.0)
    {
      v5.n128_f64[0] = v5.n128_f64[0] / v25;
      v7.n128_f64[0] = v16 / v25;
    }
    v6.n128_f64[0] = v14 - v23;
    if (v27 != 0.0)
    {
      v6.n128_f64[0] = v6.n128_f64[0] / v27;
      v8.n128_f64[0] = v18 / v27;
    }
  }
  else
  {
    v5.n128_u64[0] = *MEMORY[0x1E4F1DB20];
    v6.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    v7.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    v8.n128_u64[0] = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  }
  (*(void (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16))(v5, v6, v7, v8);
}

void __76__PIPosterSettlingEffectLoader_loadCropRectWithResource_options_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    __n128 v6 = getMediaAnalysisResultsKey();
    __n128 v7 = [v5 objectForKeyedSubscript:v6];

    __n128 v8 = getMediaAnalysisPathConstraintsStabilizationResultsKey();
    id v9 = [v7 objectForKeyedSubscript:v8];

    double v10 = [v9 firstObject];
    if (v10)
    {
      double v11 = getMediaAnalysisResultAttributesKey();
      double v12 = [v10 objectForKeyedSubscript:v11];

      if (v12)
      {
        double v13 = getMediaAnalysisResultSettlingEffectStatusAttributeKey();
        double v14 = [v12 objectForKeyedSubscript:v13];

        [*(id *)(a1 + 48) _gatingFlagsFromMADStatus:v14];
        double v15 = (double *)MEMORY[0x1E4F1DB20];
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        long long v28 = *MEMORY[0x1E4F1DB20];
        long long v29 = v16;
        double v17 = *(void **)(a1 + 48);
        id v27 = 0;
        char v18 = [v17 extractCropRect:&v28 fromStabilizationResultAttributes:v12 error:&v27];
        id v19 = v27;
        if (v18)
        {
          double v20 = [*(id *)(a1 + 32) adjustmentData];

          if (v20)
          {
            double v21 = *(void **)(a1 + 48);
            uint64_t v22 = *(void *)(a1 + 32);
            id v26 = 0;
            char v23 = [v21 adjustCropRect:&v28 forEditedLivePhotoResource:v22 error:&v26];
            id v25 = v26;

            if (v23)
            {
              (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)&v28, *((double *)&v28 + 1), *(double *)&v29, *((double *)&v29 + 1));
              id v19 = v25;
            }
            else
            {
              id v19 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to adjust stabilization crop rect" object:*(void *)(a1 + 32) underlyingError:v25];

              (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*v15, v15[1], v15[2], v15[3]);
            }
          }
          else
          {
            (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)&v28, *((double *)&v28 + 1), *(double *)&v29, *((double *)&v29 + 1));
          }
        }
        else
        {
          uint64_t v24 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to extract crop rect from stabilization result" object:v10 underlyingError:v19];

          (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*v15, v15[1], v15[2], v15[3]);
          id v19 = (id)v24;
        }
      }
      else
      {
        double v14 = [MEMORY[0x1E4F7A438] missingError:@"Missing stabilized crop rect attributes" object:v5];
        (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      }
    }
    else
    {
      double v12 = [MEMORY[0x1E4F7A438] missingError:@"Missing stabilized crop rect results" object:v5];
      (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
  }
  else
  {
    __n128 v7 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to analyze asset for stabilization" object:*(void *)(a1 + 32) underlyingError:a3];
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  }
}

+ (unint64_t)_gatingFlagsFromMADStatus:(id)a3
{
  v55[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  id v4 = (id *)getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr;
  uint64_t v50 = getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    uint64_t v44 = (uint64_t)__getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_block_invoke;
    id v45 = &unk_1E5D81578;
    double v46 = &v47;
    id v5 = MediaAnalysisLibrary();
    v48[3] = (uint64_t)dlsym(v5, "MediaAnalysisResultSettlingEffectMissingMetadataKey");
    getMediaAnalysisResultSettlingEffectMissingMetadataKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    id v4 = (id *)v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v4)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v28 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectMissingMetadataKey(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"PIPosterSettlingEffectLoader.m", 46, @"%s", dlerror());

    goto LABEL_26;
  }
  id v6 = *v4;
  v51[0] = v6;
  v55[0] = &unk_1F0009A40;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  __n128 v7 = (id *)getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr;
  uint64_t v50 = getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    uint64_t v44 = (uint64_t)__getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_block_invoke;
    id v45 = &unk_1E5D81578;
    double v46 = &v47;
    __n128 v8 = MediaAnalysisLibrary();
    v48[3] = (uint64_t)dlsym(v8, "MediaAnalysisResultSettlingEffectStabilizationFailureKey");
    getMediaAnalysisResultSettlingEffectStabilizationFailureKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    __n128 v7 = (id *)v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v7)
  {
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    id v30 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectStabilizationFailureKey(void)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"PIPosterSettlingEffectLoader.m", 47, @"%s", dlerror());

    goto LABEL_26;
  }
  id v9 = *v7;
  v51[1] = v9;
  v55[1] = &unk_1F0009A58;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  double v10 = (id *)getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr;
  uint64_t v50 = getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    uint64_t v44 = (uint64_t)__getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_block_invoke;
    id v45 = &unk_1E5D81578;
    double v46 = &v47;
    double v11 = MediaAnalysisLibrary();
    v48[3] = (uint64_t)dlsym(v11, "MediaAnalysisResultSettlingEffectVideoQualityGatingFailureKey");
    getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    double v10 = (id *)v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v10)
  {
    int v31 = [MEMORY[0x1E4F28B00] currentHandler];
    id v32 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectVideoQualityGatingFailureKey(void)"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"PIPosterSettlingEffectLoader.m", 48, @"%s", dlerror());

    goto LABEL_26;
  }
  id v12 = *v10;
  _OWORD v51[2] = v12;
  v55[2] = &unk_1F0009A70;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  double v13 = (id *)getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr;
  uint64_t v50 = getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    uint64_t v44 = (uint64_t)__getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_block_invoke;
    id v45 = &unk_1E5D81578;
    double v46 = &v47;
    double v14 = MediaAnalysisLibrary();
    v48[3] = (uint64_t)dlsym(v14, "MediaAnalysisResultSettlingEffectMetadataIntegrityFailureKey");
    getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    double v13 = (id *)v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v13)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    double v34 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectMetadataIntegrityFailureKey(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"PIPosterSettlingEffectLoader.m", 49, @"%s", dlerror());

    goto LABEL_26;
  }
  id v15 = *v13;
  v51[3] = v15;
  v55[3] = &unk_1F0009A88;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  long long v16 = (id *)getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr;
  uint64_t v50 = getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    uint64_t v44 = (uint64_t)__getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_block_invoke;
    id v45 = &unk_1E5D81578;
    double v46 = &v47;
    double v17 = MediaAnalysisLibrary();
    v48[3] = (uint64_t)dlsym(v17, "MediaAnalysisResultSettlingEffectFRCGatingFailureKey");
    getMediaAnalysisResultSettlingEffectFRCGatingFailureKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    long long v16 = (id *)v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v16)
  {
    int v35 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v36 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectFRCGatingFailureKey(void)"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"PIPosterSettlingEffectLoader.m", 50, @"%s", dlerror());

    goto LABEL_26;
  }
  id v18 = *v16;
  v51[4] = v18;
  v55[4] = &unk_1F0009AA0;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  id v19 = (id *)getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr;
  uint64_t v50 = getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    uint64_t v44 = (uint64_t)__getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_block_invoke;
    id v45 = &unk_1E5D81578;
    double v46 = &v47;
    double v20 = MediaAnalysisLibrary();
    v48[3] = (uint64_t)dlsym(v20, "MediaAnalysisResultSettlingEffectStillTransitionGatingFailureKey");
    getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKeySymbolLoc_ptr = *(void *)(v46[1] + 24);
    id v19 = (id *)v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v19)
  {
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v38 = [NSString stringWithUTF8String:"NSString *getMediaAnalysisResultSettlingEffectStillTransitionGatingFailureKey(void)"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"PIPosterSettlingEffectLoader.m", 51, @"%s", dlerror());

LABEL_26:
    __break(1u);
  }
  id v52 = *v19;
  id v53 = @"settlingEffectMinSettlingDurationThresholdFailure";
  v55[5] = &unk_1F0009AB8;
  v55[6] = &unk_1F0009AD0;
  id v54 = @"settlingEffectLivePhotoKeyFrameTimeOutOfBoundFailure";
  v55[7] = &unk_1F0009AD0;
  double v21 = (void *)MEMORY[0x1E4F1C9E8];
  id v22 = v52;
  char v23 = [v21 dictionaryWithObjects:v55 forKeys:v51 count:8];

  uint64_t v42 = 0;
  uint64_t v43 = (uint64_t)&v42;
  uint64_t v44 = 0x2020000000;
  id v45 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __58__PIPosterSettlingEffectLoader__gatingFlagsFromMADStatus___block_invoke;
  v39[3] = &unk_1E5D7F898;
  id v24 = v23;
  id v40 = v24;
  BOOL v41 = &v42;
  [v3 enumerateKeysAndObjectsUsingBlock:v39];
  unint64_t v25 = *(void *)(v43 + 24);

  _Block_object_dispose(&v42, 8);
  return v25;
}

void __58__PIPosterSettlingEffectLoader__gatingFlagsFromMADStatus___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 objectForKeyedSubscript:a2];
  uint64_t v7 = [v8 unsignedIntegerValue];
  LODWORD(v5) = [v6 BOOLValue];

  if (v5) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v7;
  }
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_livePhotoKeyFrameTimeForResource:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 adjustmentData];

  if (v7)
  {
    id v18 = 0;
    id v8 = [a2 originalCompositionForResource:v6 error:&v18];
    id v9 = v18;
    if (v8)
    {
      double v10 = [[PICompositionController alloc] initWithComposition:v8];
      double v11 = [(PICompositionController *)v10 livePhotoKeyFrameAdjustmentController];
      id v12 = v11;
      if (v11)
      {
        retstr->var0 = 0;
        *(void *)&retstr->var1 = 0;
        retstr->var3 = 0;
        [v11 keyFrameTime];
      }
      else
      {
        uint64_t v16 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
        retstr->var3 = *(void *)(v16 + 16);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_8563);
      }
      double v14 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v9;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Failed to load original composition for settling effect resource, error: %{public}@", buf, 0xCu);
      }
      uint64_t v15 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
      retstr->var3 = *(void *)(v15 + 16);
    }
  }
  else
  {
    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E4F1F9F8];
    retstr->var3 = *(void *)(v13 + 16);
  }

  return result;
}

+ (id)_resolveOptions:(id)a3 forResource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "needsInProcessHandling"));
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x2020000000;
  double v10 = (void *)getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  uint64_t v26 = getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr)
  {
    *(void *)&long long v22 = MEMORY[0x1E4F143A8];
    *((void *)&v22 + 1) = 3221225472;
    char v23 = __getVCPMediaAnalysisService_InProcessOptionSymbolLoc_block_invoke;
    id v24 = &unk_1E5D81578;
    double v11 = MediaAnalysisLibrary();
    *(void *)(*(void *)&time.timescale + 24) = dlsym(v11, "VCPMediaAnalysisService_InProcessOption");
    getVCPMediaAnalysisService_InProcessOptionSymbolLoc_ptr = *(void *)(*(void *)&time.timescale + 24);
    double v10 = *(void **)(*(void *)&time.timescale + 24);
  }
  _Block_object_dispose(&time, 8);
  if (!v10)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalysisService_InProcessOption(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PIPosterSettlingEffectLoader.m", 53, @"%s", dlerror(), v22, v23, v24);
LABEL_18:

    __break(1u);
    return result;
  }
  [v8 setObject:v9 forKeyedSubscript:*v10];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isInteractiveRequest"));
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x2020000000;
  uint64_t v13 = (void *)getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr;
  uint64_t v26 = getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr)
  {
    *(void *)&long long v22 = MEMORY[0x1E4F143A8];
    *((void *)&v22 + 1) = 3221225472;
    char v23 = __getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_block_invoke;
    id v24 = &unk_1E5D81578;
    double v14 = MediaAnalysisLibrary();
    *(void *)(*(void *)&time.timescale + 24) = dlsym(v14, "VCPMediaAnalysisService_UserInitiatedModeOption");
    getVCPMediaAnalysisService_UserInitiatedModeOptionSymbolLoc_ptr = *(void *)(*(void *)&time.timescale + 24);
    uint64_t v13 = *(void **)(*(void *)&time.timescale + 24);
  }
  _Block_object_dispose(&time, 8);
  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalysisService_UserInitiatedModeOption(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PIPosterSettlingEffectLoader.m", 54, @"%s", dlerror(), v22, v23, v24);
    goto LABEL_18;
  }
  [v8 setObject:v12 forKeyedSubscript:*v13];

  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x2020000000;
  uint64_t v15 = (void *)getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
  uint64_t v26 = getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr;
  if (!getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr)
  {
    *(void *)&long long v22 = MEMORY[0x1E4F143A8];
    *((void *)&v22 + 1) = 3221225472;
    char v23 = __getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_block_invoke;
    id v24 = &unk_1E5D81578;
    uint64_t v16 = MediaAnalysisLibrary();
    *(void *)(*(void *)&time.timescale + 24) = dlsym(v16, "VCPMediaAnalysisService_AllowOnDemandOption");
    getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr = *(void *)(*(void *)&time.timescale + 24);
    uint64_t v15 = *(void **)(*(void *)&time.timescale + 24);
  }
  _Block_object_dispose(&time, 8);
  if (!v15)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"NSString *getVCPMediaAnalysisService_AllowOnDemandOption(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PIPosterSettlingEffectLoader.m", 52, @"%s", dlerror(), v22, v23, v24);
    goto LABEL_18;
  }
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v15];
  [a1 _livePhotoKeyFrameTimeForResource:v7];
  if ((unsigned __int128)0 >> 96)
  {
    CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    memset(&time, 0, sizeof(time));
    CFDictionaryRef v18 = CMTimeCopyAsDictionary(&time, v17);
    [v8 setObject:v18 forKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
  }
  return v8;
}

@end