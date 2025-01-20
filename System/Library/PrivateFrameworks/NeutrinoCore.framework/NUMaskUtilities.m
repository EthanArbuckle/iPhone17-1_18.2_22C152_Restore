@interface NUMaskUtilities
+ ($8D19A3D7F6B32A57CF9B882F3E1C418F)_tightBoundsOfMaskImage:(SEL)a3 context:(id)a4;
+ (double)_areaOfMaskImage:(id)a3 context:(id)a4;
+ (id)propertiesForMask:(id)a3 context:(id)a4;
@end

@implementation NUMaskUtilities

+ ($8D19A3D7F6B32A57CF9B882F3E1C418F)_tightBoundsOfMaskImage:(SEL)a3 context:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F1E040];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 areaBoundsRedFilter];
  [v10 setInputImage:v9];
  [v9 extent];
  objc_msgSend(v10, "setExtent:");
  v11 = [v10 outputImage];
  [v11 extent];
  objc_msgSend(v8, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v11, v39, 16, *MEMORY[0x1E4F1E2F8], objc_msgSend(v8, "workingColorSpace"), v12, v13, v14, v15);

  double v16 = v39[0];
  double v17 = v39[1];
  double v18 = v39[2];
  double v19 = v39[3];
  [v9 extent];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v38.origin.x = v21;
  v38.origin.y = v23;
  v38.size.width = v25;
  v38.size.height = v27;
  NU::RectT<long>::RectT(&v36, &v38, 0);
  CGPoint v28 = v36;
  CGSize v29 = v37;
  CGSize v33 = v37;
  CGPoint v34 = v36;
  retstr->var0 = 0u;
  retstr->CGSize var1 = 0u;
  v38.origin = v28;
  v38.size = v29;
  NUPixelRectDenormalize((uint64_t *)&v38, 0, retstr, v16, v17, v18, v19);
  CGSize var1 = (CGSize)retstr->var1;
  v38.origin = (CGPoint)retstr->var0;
  v38.size = var1;
  CGPoint v36 = v34;
  CGSize v37 = v33;
  NU::RectT<long>::Intersection((uint64_t)v35, (uint64_t *)&v38, (uint64_t *)&v36);
  $0AC6E346AE4835514AAA8AC86D8F4844 v31 = ($0AC6E346AE4835514AAA8AC86D8F4844)v35[1];
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v35[0];
  retstr->CGSize var1 = v31;

  return result;
}

+ (double)_areaOfMaskImage:(id)a3 context:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1E040];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 areaAverageFilter];
  [v8 setInputImage:v7];
  [v7 extent];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v8, "setExtent:", v10, v12, v14, v16);
  double v17 = [v8 outputImage];
  float v20 = 0.0;
  [v17 extent];
  objc_msgSend(v6, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v17, &v20, 4, *MEMORY[0x1E4F1E2A8], 0);

  double v18 = v20;
  return v18;
}

+ (id)propertiesForMask:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    double v17 = NUAssertLogger_2795();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      double v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "mask != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float v20 = NUAssertLogger_2795();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        double v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        CGFloat v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        CGFloat v27 = [v25 callStackSymbols];
        CGPoint v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      double v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      CGFloat v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUMaskUtilities propertiesForMask:context:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUMaskUtilities.m", 34, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"mask != nil");
  }
  id v8 = v7;
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCVPixelBuffer:", objc_msgSend(v6, "CVPixelBuffer"));
  [a1 _areaOfMaskImage:v9 context:v8];
  double v11 = v10;
  memset(buf, 0, 32);
  [a1 _tightBoundsOfMaskImage:v9 context:v8];
  double v12 = [NUMaskProperties alloc];
  uint64_t v13 = [v6 size];
  v33[0] = *(_OWORD *)buf;
  v33[1] = *(_OWORD *)&buf[16];
  double v15 = -[NUMaskProperties initWithDensity:bounds:size:](v12, "initWithDensity:bounds:size:", v33, v13, v14, v11);

  return v15;
}

@end