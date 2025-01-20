@interface _NUStyleTransferThumbnailProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)generateThumbnailForImage:(id)a3 targetSize:(id)a4 colorSpace:(id)a5 configuration:(id)a6 tuningParameters:(id)a7 error:(id *)a8;
+ (id)roiTileArrayForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation _NUStyleTransferThumbnailProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] != 1)
  {
    v29 = NUAssertLogger_27648();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs.count == 1");
      *(_DWORD *)buf = 138543362;
      v66 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v32 = NUAssertLogger_27648();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v44 = (void *)MEMORY[0x1E4F29060];
        id v45 = v43;
        v46 = [v44 callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v43;
        __int16 v67 = 2114;
        v68 = v47;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2168, @"Invalid parameter not satisfying: %s", v48, v49, v50, v51, (uint64_t)"inputs.count == 1");
  }
  v11 = [v8 objectAtIndexedSubscript:0];
  v12 = [v9 objectForKeyedSubscript:@"imageExtent"];
  [v12 CGRectValue];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v70.origin.x = v14;
  v70.origin.y = v16;
  v70.size.width = v18;
  v70.size.height = v20;
  if (CGRectIsEmpty(v70))
  {
    v36 = NUAssertLogger_27648();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = [NSString stringWithFormat:@"Missing image extent!"];
      *(_DWORD *)buf = 138543362;
      v66 = v37;
      _os_log_error_impl(&dword_1A9892000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v39 = NUAssertLogger_27648();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
    if (v38)
    {
      if (v40)
      {
        v52 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v53 = (void *)MEMORY[0x1E4F29060];
        id v54 = v52;
        v55 = [v53 callStackSymbols];
        v56 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v52;
        __int16 v67 = 2114;
        v68 = v56;
        _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v40)
    {
      v41 = [MEMORY[0x1E4F29060] callStackSymbols];
      v42 = [v41 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v42;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor processWithInputs:arguments:output:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2172, @"Missing image extent!", v57, v58, v59, v60, v61);
  }
  v21 = [v9 objectForKeyedSubscript:@"config"];
  v22 = [v9 objectForKeyedSubscript:@"tuning"];
  v23 = [v10 metalCommandBuffer];
  v24 = [v23 commandQueue];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __79___NUStyleTransferThumbnailProcessor_processWithInputs_arguments_output_error___block_invoke;
  v62[3] = &unk_1E5D95D50;
  id v63 = v11;
  id v64 = v10;
  id v25 = v10;
  id v26 = v11;
  BOOL v27 = +[_NUStyleEngine usingSharedStyleEngineForUsage:@"apply" withMetalCommandQueue:v24 configuration:v21 tuningParams:v22 perform:v62];

  return v27;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

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
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = [v9 objectForKeyedSubscript:@"imageExtent"];
  [v10 CGRectValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v70.origin.CGFloat x = v12;
  v70.origin.CGFloat y = v14;
  v70.size.CGFloat width = v16;
  v70.size.CGFloat height = v18;
  if (CGRectIsEmpty(v70))
  {
    v32 = NUAssertLogger_27648();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      BOOL v33 = [NSString stringWithFormat:@"Missing image extent"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_27648();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        uint64_t v48 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v49 = (void *)MEMORY[0x1E4F29060];
        id v50 = v48;
        uint64_t v51 = [v49 callStackSymbols];
        v52 = [v51 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v48;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v52;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2133, @"Missing image extent", v53, v54, v55, v56, (uint64_t)v66);
  }
  double v19 = [v9 objectForKeyedSubscript:@"config"];
  CGFloat v20 = [v19 objectForKeyedSubscript:@"thumbnailWidth"];
  uint64_t v21 = [v20 integerValue];

  v22 = [v19 objectForKeyedSubscript:@"thumbnailHeight"];
  uint64_t v23 = [v22 integerValue];

  if ((v23 | v21) < 0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v40 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    v66 = @"(width >= 0) && (height >= 0)";
    [v39 handleFailureInFunction:v40 file:@"NUGeometryPrimitives.h" lineNumber:38 description:@"Invalid parameter not satisfying: %@"];

    if (!v21)
    {
LABEL_12:
      v41 = NUAssertLogger_27648();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = [NSString stringWithFormat:@"Missing thumbnail size"];
        LODWORD(buf.origin.x) = 138543362;
        *(void *)((char *)&buf.origin.x + 4) = v42;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      v43 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v44 = NUAssertLogger_27648();
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
      if (v43)
      {
        if (v45)
        {
          uint64_t v57 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v58 = (void *)MEMORY[0x1E4F29060];
          id v59 = v57;
          uint64_t v60 = [v58 callStackSymbols];
          uint64_t v61 = [v60 componentsJoinedByString:@"\n"];
          LODWORD(buf.origin.x) = 138543618;
          *(void *)((char *)&buf.origin.x + 4) = v57;
          WORD2(buf.origin.y) = 2114;
          *(void *)((char *)&buf.origin.y + 6) = v61;
          _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
        }
      }
      else if (v45)
      {
        v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        v47 = [v46 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543362;
        *(void *)((char *)&buf.origin.x + 4) = v47;
        _os_log_error_impl(&dword_1A9892000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor roiForInput:arguments:outputRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2138, @"Missing thumbnail size", v62, v63, v64, v65, (uint64_t)v66);
    }
  }
  else if (!v21)
  {
    goto LABEL_12;
  }
  if (!v23) {
    goto LABEL_12;
  }
  buf.origin.CGFloat x = x;
  buf.origin.CGFloat y = y;
  buf.size.CGFloat width = width;
  buf.size.CGFloat height = height;
  NU::RectT<long>::RectT(&v67, &buf, 3);
  CGRect buf = v67;
  NU::RectT<long>::grow((uint64_t *)&buf, 1, 1);
  v71.origin.CGFloat x = v12 + (double)*(uint64_t *)&buf.origin.x / (double)v21 * v16;
  v71.origin.CGFloat y = v14 + (double)*(uint64_t *)&buf.origin.y / (double)v23 * v18;
  v71.size.CGFloat width = (double)*(uint64_t *)&buf.size.width / (double)v21 * v16;
  v71.size.CGFloat height = (double)*(uint64_t *)&buf.size.height / (double)v23 * v18;
  CGRect v72 = CGRectIntegral(v71);
  v75.origin.CGFloat x = v12;
  v75.origin.CGFloat y = v14;
  v75.size.CGFloat width = v16;
  v75.size.CGFloat height = v18;
  CGRect v73 = CGRectIntersection(v72, v75);
  CGFloat v24 = v73.origin.x;
  CGFloat v25 = v73.origin.y;
  CGFloat v26 = v73.size.width;
  CGFloat v27 = v73.size.height;

  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (int)outputFormat
{
  return *MEMORY[0x1E4F1E280];
}

+ (int)formatForInputAtIndex:(int)a3
{
  return *MEMORY[0x1E4F1E280];
}

+ (id)generateThumbnailForImage:(id)a3 targetSize:(id)a4 colorSpace:(id)a5 configuration:(id)a6 tuningParameters:(id)a7 error:(id *)a8
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v14)
  {
    double v31 = NUAssertLogger_27648();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger_27648();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        id v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        uint64_t v62 = [v60 callStackSymbols];
        uint64_t v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v99 = v59;
        __int16 v100 = 2114;
        v101 = v63;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      BOOL v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2085, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"inputImage != nil");
  }
  if (!v15)
  {
    v38 = NUAssertLogger_27648();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "colorSpace != nil");
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v41 = NUAssertLogger_27648();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        v68 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v69 = (void *)MEMORY[0x1E4F29060];
        id v70 = v68;
        CGRect v71 = [v69 callStackSymbols];
        CGRect v72 = [v71 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v99 = v68;
        __int16 v100 = 2114;
        v101 = v72;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2086, @"Invalid parameter not satisfying: %s", v73, v74, v75, v76, (uint64_t)"colorSpace != nil");
  }
  if (!v16)
  {
    BOOL v45 = NUAssertLogger_27648();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "config != nil");
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v46;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v47 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v48 = NUAssertLogger_27648();
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v47)
    {
      if (v49)
      {
        v77 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v78 = (void *)MEMORY[0x1E4F29060];
        id v79 = v77;
        v80 = [v78 callStackSymbols];
        v81 = [v80 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v99 = v77;
        __int16 v100 = 2114;
        v101 = v81;
        _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v49)
    {
      id v50 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v51 = [v50 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v51;
      _os_log_error_impl(&dword_1A9892000, v48, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2087, @"Invalid parameter not satisfying: %s", v82, v83, v84, v85, (uint64_t)"config != nil");
  }
  double v18 = v17;
  if (!v17)
  {
    v52 = NUAssertLogger_27648();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tuningParams != nil");
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v55 = NUAssertLogger_27648();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (v54)
    {
      if (v56)
      {
        v86 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v87 = (void *)MEMORY[0x1E4F29060];
        id v88 = v86;
        v89 = [v87 callStackSymbols];
        v90 = [v89 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v99 = v86;
        __int16 v100 = 2114;
        v101 = v90;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      uint64_t v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v99 = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUStyleTransferThumbnailProcessor generateThumbnailForImage:targetSize:colorSpace:configuration:tuningParameters:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NUStyleTransferNode.m", 2088, @"Invalid parameter not satisfying: %s", v91, v92, v93, v94, (uint64_t)"tuningParams != nil");
  }
  double v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  CGFloat v20 = objc_msgSend(v14, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v15, "CGColorSpace"));
  [v19 addObject:v20];

  double v21 = (double)var0;
  double v22 = (double)var1;
  v96[0] = @"tuning";
  v96[1] = @"config";
  v97[0] = v18;
  v97[1] = v16;
  v96[2] = @"thumbExtent";
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", 0.0, 0.0, (double)var0, (double)var1);
  v97[2] = v23;
  v96[3] = @"imageExtent";
  CGFloat v24 = (void *)MEMORY[0x1E4F1E080];
  [v14 extent];
  CGFloat v25 = objc_msgSend(v24, "vectorWithCGRect:");
  v97[3] = v25;
  CGFloat v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:4];

  id v95 = 0;
  CGFloat v27 = objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v19, v26, &v95, 0.0, 0.0, v21, v22);
  id v28 = v95;
  if (v27)
  {
    double v29 = objc_msgSend(v27, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v15, "CGColorSpace"));
  }
  else
  {
    +[NUError errorWithCode:1 reason:@"Failed to generate thumbnail" object:a1 underlyingError:v28];
    double v29 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

@end