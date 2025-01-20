@interface _VUIMonogramInitialsSilhouetteImageGenerator
+ (id)monogramImageWithDescription:(id)a3;
+ (void)drawInitialsWithRect:(CGRect)a3 andDescription:(id)a4;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _VUIMonogramInitialsSilhouetteImageGenerator

+ (void)drawInitialsWithRect:(CGRect)a3 andDescription:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 fillColor];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1618] blackColor];
  }
  v12 = v11;

  [v8 size];
  double v14 = v13;
  [v8 cornerRadius];
  if (v15 <= 0.0)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    id v18 = [v8 gradientStartColor];
    uint64_t v19 = [v8 gradientEndColor];
    v20 = (void *)v19;
    if (!v18 || !v19)
    {
      id v21 = v12;

      id v18 = v21;
      v20 = v18;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1E38FE180;
    id v23 = v18;
    v69[0] = [v23 CGColor];
    id v24 = v20;
    v69[1] = [v24 CGColor];
    CFArrayRef v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    CGGradientRef v26 = CGGradientCreateWithColors(DeviceRGB, v25, locations);
    if (v26)
    {
      v27 = v26;
      v77.origin.double x = x;
      v77.origin.double y = y;
      v77.size.double width = width;
      v77.size.double height = height;
      CGFloat MaxY = CGRectGetMaxY(v77);
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(CurrentContext, 0.0, height);
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      v73.double x = 0.0;
      v73.double y = 0.0;
      v75.double x = 0.0;
      v75.double y = MaxY;
      CGContextDrawLinearGradient(CurrentContext, v27, v73, v75, 3u);
      CGContextRestoreGState(CurrentContext);
      CGGradientRelease(v27);
    }
    else
    {
      [v12 setFill];
      v79.origin.double x = x;
      v79.origin.double y = y;
      v79.size.double width = width;
      v79.size.double height = height;
      UIRectFill(v79);
    }
    CFRelease(DeviceRGB);
  }
  else
  {
    double v16 = v15;
    if (fabs(v14 * 0.5) == v15)
    {
      +[VUIBezierPath bezierPathWithOvalInRect:](VUIBezierPath, "bezierPathWithOvalInRect:", x, y, width, height);
    }
    else
    {
      [v8 size];
      +[VUIBezierPath vui_bezierPathWithRoundedRect:radius:](VUIBezierPath, "vui_bezierPathWithRoundedRect:radius:", x, y, width, height, v16 * (fmax(width, height) / fmax(v29, v30)));
    }
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v31 = UIGraphicsGetCurrentContext();
    id v32 = [v8 gradientStartColor];
    uint64_t v33 = [v8 gradientEndColor];
    v34 = (void *)v33;
    if (!v32 || !v33)
    {
      id v35 = v12;

      id v32 = v35;
      v34 = v32;
    }
    v36 = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1E38FE180;
    id v24 = v32;
    v70[0] = [v24 CGColor];
    CFArrayRef v25 = v34;
    v70[1] = [(__CFArray *)v25 CGColor];
    CFArrayRef v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    CGGradientRef v38 = CGGradientCreateWithColors(v36, v37, locations);
    if (v38)
    {
      v39 = v38;
      v78.origin.double x = x;
      v78.origin.double y = y;
      v78.size.double width = width;
      v78.size.double height = height;
      CGFloat v40 = CGRectGetMaxY(v78);
      CGContextSaveGState(v31);
      CGContextAddPath(v31, (CGPathRef)[v23 CGPath]);
      CGContextTranslateCTM(v31, 0.0, height);
      CGContextScaleCTM(v31, 1.0, -1.0);
      CGContextClip(v31);
      v74.double x = 0.0;
      v74.double y = 0.0;
      v76.double x = 0.0;
      v76.double y = v40;
      CGContextDrawLinearGradient(v31, v39, v74, v76, 3u);
      CGContextRestoreGState(v31);
      CGGradientRelease(v39);
    }
    else
    {
      [v23 addClip];
      [v12 set];
      [v23 fill];
    }
    CFRelease(v36);
  }
  v41 = [v8 font];
  v42 = [v8 text];
  if ([v42 length])
  {
    v43 = [v8 textColor];
    v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }
    else
    {
      id v45 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    v46 = v45;

    id v47 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v48 = *MEMORY[0x1E4FB0700];
    v67[0] = *MEMORY[0x1E4FB06F8];
    v67[1] = v48;
    v68[0] = v41;
    v68[1] = v46;
    v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
    v50 = (void *)[v47 initWithString:v42 attributes:v49];

    [v50 size];
    double v52 = v51;
    double v54 = v53;
    [v8 specialOffsetForString:v42];
    +[VUIUtilities vuiRectCenteredXInRect:boundsToCenterIn:offset:](VUIUtilities, "vuiRectCenteredXInRect:boundsToCenterIn:offset:", 0.0, 0.0, v52, v54, x, y, width, height, v55);
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    [v41 capHeight];
    double v63 = (height - v62) * -0.5;
    [v41 pointSize];
    double v65 = height - v64 + v63;
    v66 = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(v66, kCGBlendModeCopy);
    objc_msgSend(v50, "drawInRect:", v57, v65, v59, v61);
  }
}

+ (id)monogramImageWithDescription:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [v3 defaultImageSize];
  double v9 = v8;
  double v11 = v10;
  v12 = [MEMORY[0x1E4FB3CA8] preferredFormat];
  [v12 setPreferredRange:2];
  double v13 = (void *)MEMORY[0x1E4FB3CA8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke;
  v23[3] = &unk_1E6DFAA48;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  double v27 = v9;
  double v28 = v11;
  id v14 = v3;
  id v24 = v14;
  double v15 = objc_msgSend(v13, "imageWithSize:format:actions:", v12, v23, v9, v11);
  if (v9 != v5 || v11 != v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke_2;
    v17[3] = &unk_1E6DFAA48;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    id v18 = v15;
    double v21 = v5;
    double v22 = v7;
    double v15 = objc_msgSend(MEMORY[0x1E4FB3CA8], "imageWithSize:format:actions:", v12, v17, v5, v7);
  }
  return v15;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;
  if ([v5 preferedMonogramType] == 2)
  {
    double v6 = [v5 text];
    double v7 = [v5 font];
    double v8 = [v7 fontName];
    double v9 = [v5 fillColor];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] blackColor];
    }
    double v16 = v11;

    double v34 = 0.0;
    double v35 = 0.0;
    uint64_t v32 = 0;
    double v33 = 0.0;
    [MEMORY[0x1E4FB3C70] vuiColor:v16 getRed:&v35 green:&v34 blue:&v33 alpha:&v32];
    v17 = NSString;
    if ([(__CFString *)v6 length]) {
      id v18 = v6;
    }
    else {
      id v18 = &stru_1F3E921E0;
    }
    [v7 pointSize];
    uint64_t v20 = v19;
    [v5 cornerRadius];
    double v21 = "odel";
    LODWORD(v21) = vcvtad_u64_f64(v35 * 255.0);
    LODWORD(v22) = vcvtad_u64_f64(v34 * 255.0);
    LODWORD(v23) = vcvtad_u64_f64(v33 * 255.0);
    v12 = [v17 stringWithFormat:@"%@_%@_%.0f_%.0f_%02X%02X%02X%.1f", v18, v8, v20, v24, v21, v22, v23, v32];
  }
  else
  {
    if ([v5 preferedMonogramType] != 1 && objc_msgSend(v5, "preferedMonogramType"))
    {
      v12 = 0;
      goto LABEL_25;
    }
    double v13 = [v5 fillColor];
    id v14 = v13;
    if (v13)
    {
      double v15 = v13;
    }
    else
    {
      double v15 = [MEMORY[0x1E4FB1618] blackColor];
    }
    double v6 = v15;

    double v34 = 0.0;
    double v35 = 0.0;
    uint64_t v32 = 0;
    double v33 = 0.0;
    if (v6) {
      [MEMORY[0x1E4FB3C70] vuiColor:v6 getRed:&v35 green:&v34 blue:&v33 alpha:&v32];
    }
    uint64_t v25 = NSString;
    if ([v5 shouldFallBackToSilhouette]) {
      uint64_t v26 = @"yes-man";
    }
    else {
      uint64_t v26 = @"no-man";
    }
    [v5 cornerRadius];
    double v27 = "odel";
    LODWORD(v27) = vcvtad_u64_f64(v35 * 255.0);
    LODWORD(v28) = vcvtad_u64_f64(v34 * 255.0);
    LODWORD(v29) = vcvtad_u64_f64(v33 * 255.0);
    v12 = [v25 stringWithFormat:@"Silhouette_%@_%.0f_%02X%02X%02X%.1f", v26, v30, v27, v28, v29, v32];
  }

LABEL_25:
  return v12;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v11;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F28B48]);
    objc_initWeak(&location, v16);
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    uint64_t v23 = &unk_1E6DF43D0;
    objc_copyWeak(&v26, &location);
    id v24 = v15;
    id v25 = v13;
    [v16 addExecutionBlock:&v20];
    v17 = [(_VUIMonogramImageGenerator *)self imageGeneratorQueue];
    [v17 addOperation:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB3E18] code:107 userInfo:0];
    (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v18);

    id v16 = 0;
  }

  return v16;
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 cancel];
  }
}

@end