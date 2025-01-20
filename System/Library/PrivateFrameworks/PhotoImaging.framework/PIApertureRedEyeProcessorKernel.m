@interface PIApertureRedEyeProcessorKernel
+ ($FD18CD26FAB5729647810B74E671536E)ROIForCenterPoint:(SEL)a3 radius:(CGPoint)a4;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)convertFixed16:(const unsigned __int16 *)a3 toFloat:(float *)a4 count:(unint64_t)a5;
+ (void)convertFloat:(const float *)a3 toFixed16:(unsigned __int16 *)a4 count:(unint64_t)a5;
@end

@implementation PIApertureRedEyeProcessorKernel

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E2F8];
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E2F8];
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"ROI", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v10 format];
  if (v11 != *MEMORY[0x1E4F1E2F8]) {
    __assert_rtn("+[PIApertureRedEyeProcessorKernel processWithInputs:arguments:output:error:]", "PIApertureRedEyeFilter.mm", 88, "output.format == kCIFormatRGBAf");
  }
  id v12 = v10;
  double v13 = (void *)[v12 baseAddress];
  unint64_t v14 = [v12 bytesPerRow];
  [v12 region];
  double v16 = v15;
  [v12 region];
  bzero(v13, (unint64_t)(v17 * 16.0 + (double)v14 * (v16 + -1.0)));
  v66 = [MEMORY[0x1E4F7A5D8] RGBAf];
  v63 = v9;
  v64 = v8;
  v18 = [v9 objectForKeyedSubscript:@"Sensitivity"];
  [v18 doubleValue];
  double v20 = v19;

  long long v90 = 0u;
  long long v91 = 0u;
  v21 = [v9 objectForKeyedSubscript:@"ROI"];
  [v21 CGRectValue];
  NUPixelRectFromCGRect();

  v22 = [v8 objectAtIndexedSubscript:0];
  uint64_t v23 = objc_msgSend(v22, "bytesPerRow", v22);
  long long v88 = 0u;
  long long v89 = 0u;
  [v22 region];
  NUPixelRectFromCGRect();
  id v24 = v22;
  uint64_t v25 = [v24 baseAddress];
  uint64_t v26 = NUMaxY();
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v59 = NUMaxY();
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v58 = NUMinX();
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v57 = NUMinX();
  long long v98 = 0u;
  long long v99 = 0u;
  [v12 region];
  NUPixelRectFromCGRect();
  uint64_t v27 = v25;
  v60 = v24;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v28 = 16 * NUWidth();
  id v62 = [MEMORY[0x1E4F1CA58] dataWithLength:NUHeight() * v28];
  uint64_t v29 = [v62 mutableBytes];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v30 = 8 * NUWidth();
  id v61 = [MEMORY[0x1E4F1CA58] dataWithLength:NUHeight() * v30];
  uint64_t v31 = [v61 mutableBytes];
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v32 = NUWidth();
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v33 = NUHeight();
  if (v32)
  {
    uint64_t v34 = v33;
    if (v33)
    {
      v35 = (char *)(v27 + (v26 - v59) * v23 + 16 * (v58 - v57));
      size_t v36 = 16 * v32;
      v37 = (char *)v29;
      do
      {
        memcpy(v37, v35, v36);
        v35 += v23;
        v37 += v28;
        --v34;
      }
      while (v34);
    }
  }
  long long v74 = v90;
  long long v75 = v91;
  uint64_t v38 = NUWidth();
  long long v72 = v90;
  long long v73 = v91;
  uint64_t v39 = 4 * v38 * NUHeight();
  [a1 convertFloat:v29 toFixed16:v31 count:v39];
  id v40 = objc_alloc(MEMORY[0x1E4F7A588]);
  v41 = [MEMORY[0x1E4F7A5D8] RGBA16];
  v42 = (void *)[v40 initWithSize:v91 format:v41 rowBytes:v30 mutableBytes:v31];

  fixRedeye(v42, fmax(fmin(v20, 1.0), 0.01));
  [a1 convertFixed16:v31 toFloat:v29 count:v39];
  v43 = [MEMORY[0x1E4F7A400] genericRGBLinearColorSpace];
  id v44 = objc_alloc(MEMORY[0x1E4F7A3A8]);
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F7A3A0]) initWithSize:v91 format:v66 rowBytes:v28 bytes:v29];
  v70[1] = 0;
  v70[0] = 0;
  long long v71 = v91;
  v46 = [MEMORY[0x1E4F7A5F8] regionWithRect:v70];
  v47 = (void *)[v44 initWithBuffer:v45 colorSpace:v43 validRegion:v46];

  id v48 = objc_alloc(MEMORY[0x1E4F7A590]);
  id v49 = objc_alloc(MEMORY[0x1E4F7A588]);
  long long v50 = v99;
  uint64_t v51 = [v12 bytesPerRow];
  id v52 = v12;
  v53 = objc_msgSend(v49, "initWithSize:format:rowBytes:mutableBytes:", v50, v66, v51, objc_msgSend(v52, "baseAddress"));
  v68[1] = 0;
  v68[0] = 0;
  long long v69 = v99;
  v54 = [MEMORY[0x1E4F7A5F8] regionWithRect:v68];
  v55 = (void *)[v48 initWithMutableBuffer:v53 colorSpace:v43 validRegion:v54];

  long long v96 = 0u;
  long long v97 = 0u;
  v67[24] = v98;
  v67[25] = v99;
  v67[22] = v90;
  v67[23] = v91;
  NUPixelRectIntersection();
  long long v94 = 0u;
  long long v95 = 0u;
  v67[20] = v96;
  v67[21] = v97;
  v67[18] = v96;
  v67[19] = v97;
  NUMinX();
  v67[16] = v90;
  v67[17] = v91;
  NUMinX();
  v67[14] = v90;
  v67[15] = v91;
  NUMaxY();
  v67[12] = v96;
  v67[13] = v97;
  NUMaxY();
  NUPixelRectSetOrigin();
  v67[10] = v96;
  v67[11] = v97;
  v67[8] = v96;
  v67[9] = v97;
  NUMinX();
  v67[6] = v98;
  v67[7] = v99;
  NUMinX();
  v67[4] = v98;
  v67[5] = v99;
  NUMaxY();
  v67[2] = v96;
  v67[3] = v97;
  NUMaxY();
  NUPixelRectSetOrigin();
  v67[0] = v94;
  v67[1] = v95;
  [MEMORY[0x1E4F7A528] copyPixelsFromImage:v47 srcRect:v67 destImage:v55 destOrigin:v92];

  return 1;
}

+ (void)convertFixed16:(const unsigned __int16 *)a3 toFloat:(float *)a4 count:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  src.data = (void *)a3;
  src.height = 1;
  src.width = a5;
  src.rowBytes = 2 * a5;
  dest.data = a4;
  dest.height = 1;
  dest.width = a5;
  dest.rowBytes = 4 * a5;
  if (vImageConvert_16UToF(&src, &dest, 0.0, 0.000015259, 0))
  {
    v5 = NUAssertLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v6 = [NSString stringWithFormat:@"Bad fixed 16 to float conversion"];
      *(_DWORD *)buf = 138543362;
      double v19 = v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v7 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        double v13 = dispatch_get_specific(*v7);
        unint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v19 = v13;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v19 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
}

+ (void)convertFloat:(const float *)a3 toFixed16:(unsigned __int16 *)a4 count:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  src.data = (void *)a3;
  src.height = 1;
  src.width = a5;
  src.rowBytes = 4 * a5;
  dest.data = a4;
  dest.height = 1;
  dest.width = a5;
  dest.rowBytes = 2 * a5;
  if (vImageConvert_FTo16U(&src, &dest, 0.0, 0.000015259, 0))
  {
    v5 = NUAssertLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double v6 = [NSString stringWithFormat:@"Bad float to fixed 16 conversion"];
      *(_DWORD *)buf = 138543362;
      double v19 = v6;
      _os_log_error_impl(&dword_1A9680000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v7 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        double v13 = dispatch_get_specific(*v7);
        unint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        double v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v19 = v13;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      int v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v19 = v12;
      _os_log_error_impl(&dword_1A9680000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
}

+ ($FD18CD26FAB5729647810B74E671536E)ROIForCenterPoint:(SEL)a3 radius:(CGPoint)a4
{
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  return ($FD18CD26FAB5729647810B74E671536E *)NUPixelRectFromCGRect();
}

@end