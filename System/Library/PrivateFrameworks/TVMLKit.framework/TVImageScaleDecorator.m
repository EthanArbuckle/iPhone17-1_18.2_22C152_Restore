@interface TVImageScaleDecorator
- (BOOL)centerGrowth;
- (BOOL)cornerContinuous;
- (BOOL)cropToFit;
- (BOOL)isEqual:(id)a3;
- (BOOL)loaderCropToFit;
- (BOOL)needsAlphaForImage:(id)a3;
- (BOOL)preservesAlpha;
- (CGSize)_scaleToSizeAdjustedForUpscaling;
- (CGSize)scaleToSize;
- (TVCornerRadii)cornerRadii;
- (TVImageScaleDecorator)init;
- (TVImageScaleDecorator)initWithScaleToSize:(CGSize)a3;
- (TVImageScaleDecorator)initWithScaleToSize:(CGSize)a3 cropToFit:(BOOL)a4;
- (TVImageScaleDecorator)initWithScaleToSize:(CGSize)a3 scaleMode:(int64_t)a4;
- (UIColor)bgColor;
- (UIEdgeInsets)_paddingAdjustedForUpscaling;
- (UIEdgeInsets)padding;
- (double)_focusedSizeIncreaseFactor;
- (double)focusedSizeIncrease;
- (double)upscaleAdjustment;
- (id)_imageFixedForRotation:(id)a3;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
- (id)decoratorIdentifier;
- (int64_t)scaleMode;
- (unint64_t)hash;
- (void)_applyCornerMaskForRect:(CGRect)a3 toContext:(CGContext *)a4;
- (void)setBgColor:(id)a3;
- (void)setCenterGrowth:(BOOL)a3;
- (void)setCornerContinuous:(BOOL)a3;
- (void)setCornerRadii:(TVCornerRadii)a3;
- (void)setCropToFit:(BOOL)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPreservesAlpha:(BOOL)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setScaleToSize:(CGSize)a3;
- (void)setUpscaleAdjustment:(double)a3;
@end

@implementation TVImageScaleDecorator

- (TVImageScaleDecorator)init
{
  return -[TVImageScaleDecorator initWithScaleToSize:scaleMode:](self, "initWithScaleToSize:scaleMode:", 1, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (TVImageScaleDecorator)initWithScaleToSize:(CGSize)a3
{
  return -[TVImageScaleDecorator initWithScaleToSize:scaleMode:](self, "initWithScaleToSize:scaleMode:", 1, a3.width, a3.height);
}

- (TVImageScaleDecorator)initWithScaleToSize:(CGSize)a3 scaleMode:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)TVImageScaleDecorator;
  result = [(TVImageScaleDecorator *)&v8 init];
  if (result)
  {
    result->_scaleToSize.CGFloat width = width;
    result->_scaleToSize.CGFloat height = height;
    result->_scaleMode = a4;
    *(_OWORD *)&result->_cornerRadii.topLeft = TVCornerRadiiZero;
    *(_OWORD *)&result->_cornerRadii.bottomLeft = *(_OWORD *)&qword_230C384E8;
    result->_preservesAlpha = 1;
  }
  return result;
}

- (TVImageScaleDecorator)initWithScaleToSize:(CGSize)a3 cropToFit:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  return -[TVImageScaleDecorator initWithScaleToSize:scaleMode:](self, "initWithScaleToSize:scaleMode:", v4, a3.width, a3.height);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 scaleMode] == 2 && -[TVImageScaleDecorator scaleMode](self, "scaleMode") == 2)
  {
    v5 = [v4 bgColor];
    v6 = [(TVImageScaleDecorator *)self bgColor];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 1;
  }
  [v4 cornerRadii];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(TVImageScaleDecorator *)self cornerRadii];
  if (v9 == v16
    && ([(TVImageScaleDecorator *)self cornerRadii], v11 == v17)
    && ([(TVImageScaleDecorator *)self cornerRadii], v13 == v18))
  {
    [(TVImageScaleDecorator *)self cornerRadii];
    BOOL v20 = v15 == v19;
  }
  else
  {
    BOOL v20 = 0;
  }
  v45.receiver = self;
  v45.super_class = (Class)TVImageScaleDecorator;
  if (![(TVImageDecorator *)&v45 isEqual:v4]) {
    goto LABEL_20;
  }
  [v4 scaleToSize];
  double v22 = v21;
  double v24 = v23;
  [(TVImageScaleDecorator *)self scaleToSize];
  BOOL v26 = 0;
  if (v22 == v27 && v24 == v25)
  {
    [v4 padding];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    [(TVImageScaleDecorator *)self padding];
    BOOL v26 = 0;
    if (v31 == v39 && v29 == v36 && v35 == v38 && v33 == v37)
    {
      uint64_t v40 = [v4 scaleMode];
      if (v40 == [(TVImageScaleDecorator *)self scaleMode])
      {
        [v4 focusedSizeIncrease];
        double v42 = v41;
        [(TVImageScaleDecorator *)self focusedSizeIncrease];
        if (v42 == v43)
        {
          BOOL v26 = v7 && v20;
          goto LABEL_21;
        }
      }
LABEL_20:
      BOOL v26 = 0;
    }
  }
LABEL_21:

  return v26;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263F08D40];
  [(TVImageScaleDecorator *)self scaleToSize];
  v3 = objc_msgSend(v2, "valueWithCGSize:");
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)cropToFit
{
  return self->_scaleMode == 3;
}

- (void)setCropToFit:(BOOL)a3
{
  int64_t v3 = 3;
  if (!a3) {
    int64_t v3 = 1;
  }
  self->_scaleMode = v3;
}

- (double)upscaleAdjustment
{
  return self->_focusedSizeIncrease;
}

- (void)setUpscaleAdjustment:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (id)decoratorIdentifier
{
  int64_t v3 = [MEMORY[0x263F089D8] string];
  double width = self->_scaleToSize.width;
  if (width != 0.0)
  {
    double height = self->_scaleToSize.height;
    if (height != 0.0)
    {
      uint64_t v6 = (int)width;
      uint64_t v7 = (int)height;
      double v8 = [MEMORY[0x263F1C920] mainScreen];
      [v8 scale];
      objc_msgSend(v3, "appendFormat:", @"%dx%d_%.0f", v6, v7, v9);

      if (!self->_preservesAlpha) {
        [v3 appendString:@"_noAlpha"];
      }
      int64_t scaleMode = self->_scaleMode;
      if (scaleMode == 2)
      {
        [v3 appendString:@"_fitBB"];
        bgColor = self->_bgColor;
        if (bgColor)
        {
          double v43 = 0.0;
          double v44 = 0.0;
          double v41 = 0.0;
          double v42 = 0.0;
          [(UIColor *)bgColor getRed:&v44 green:&v43 blue:&v42 alpha:&v41];
          double v13 = &off_230C37000;
          LODWORD(v13) = vcvtad_u64_f64(v44 * 255.0);
          LODWORD(v14) = vcvtad_u64_f64(v43 * 255.0);
          LODWORD(v15) = vcvtad_u64_f64(v42 * 255.0);
          float v16 = v41;
          objc_msgSend(v3, "appendFormat:", @"(%02X%02X%02X%.1f)", v13, v14, v15, v16);
        }
      }
      else
      {
        if (scaleMode == 4)
        {
          double v11 = @"_fitHeight";
        }
        else
        {
          if (scaleMode != 3) {
            goto LABEL_13;
          }
          double v11 = @"_fill";
        }
        [v3 appendString:v11];
      }
    }
  }
LABEL_13:
  if (!+[TVCornerUtilities radiiIsZero:](TVCornerUtilities, "radiiIsZero:", self->_cornerRadii.topLeft, self->_cornerRadii.topRight, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight))
  {
    float topLeft = self->_cornerRadii.topLeft;
    float topRight = self->_cornerRadii.topRight;
    float bottomLeft = self->_cornerRadii.bottomLeft;
    float bottomRight = self->_cornerRadii.bottomRight;
    objc_msgSend(v3, "appendFormat:", @"_br(%.f,%.f,%.f,%.f)", topLeft, topRight, bottomLeft, bottomRight);
  }
  [(TVImageScaleDecorator *)self padding];
  if (v24 != *(double *)(MEMORY[0x263F1D1C0] + 8)
    || v21 != *MEMORY[0x263F1D1C0]
    || v23 != *(double *)(MEMORY[0x263F1D1C0] + 24)
    || v22 != *(double *)(MEMORY[0x263F1D1C0] + 16))
  {
    [(TVImageScaleDecorator *)self padding];
    float v29 = v28;
    double v30 = v29;
    [(TVImageScaleDecorator *)self padding];
    *(float *)&double v31 = v31;
    double v32 = *(float *)&v31;
    [(TVImageScaleDecorator *)self padding];
    float v34 = v33;
    double v35 = v34;
    [(TVImageScaleDecorator *)self padding];
    float v37 = v36;
    objc_msgSend(v3, "appendFormat:", @"_pad(%.f,%.f,%.f,%.f)", *(void *)&v30, *(void *)&v32, *(void *)&v35, v37);
  }
  if ([v3 length]) {
    double v38 = v3;
  }
  else {
    double v38 = 0;
  }
  id v39 = v38;

  return v39;
}

- (BOOL)loaderCropToFit
{
  return self->_scaleMode == 3;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  [(TVImageScaleDecorator *)self _scaleToSizeAdjustedForUpscaling];
  double v11 = v10;
  double v13 = v12;
  [(TVImageScaleDecorator *)self _paddingAdjustedForUpscaling];
  double v18 = v14;
  double v19 = v15;
  if (v11 == *MEMORY[0x263F001B0] && v13 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    goto LABEL_59;
  }
  double v21 = v16;
  double v22 = v17;
  BOOL v23 = v11 == width && v13 == height;
  if (v23
    && ((scaleMode = self->_scaleMode, scaleMode == 3) ? (BOOL v25 = !v5) : (BOOL v25 = 0),
        !v25 ? (BOOL v26 = scaleMode == 2) : (BOOL v26 = 1),
        !v26 ? (BOOL v27 = scaleMode == 4) : (BOOL v27 = 1),
        !v27
     && (v15 == *(double *)(MEMORY[0x263F1D1C0] + 8) ? (BOOL v67 = v14 == *MEMORY[0x263F1D1C0]) : (BOOL v67 = 0),
         v67 ? (BOOL v68 = v17 == *(double *)(MEMORY[0x263F1D1C0] + 24)) : (BOOL v68 = 0),
         v68 ? (BOOL v69 = v16 == *(double *)(MEMORY[0x263F1D1C0] + 16)) : (BOOL v69 = 0),
         v69)))
  {
LABEL_59:
    if ((objc_opt_respondsToSelector() & 1) == 0
      && +[TVCornerUtilities radiiIsZero:](TVCornerUtilities, "radiiIsZero:", self->_cornerRadii.topLeft, self->_cornerRadii.topRight, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight))
    {
      id v66 = v9;
      goto LABEL_66;
    }
    [v9 pixelBounds];
    double v71 = v70;
    double v73 = v72;
    id v74 = v9;
    v60 = +[TVGraphicsImageRenderer formatWithCGImage:](TVGraphicsImageRenderer, "formatWithCGImage:", [v74 image]);
    BOOL v75 = [(TVImageScaleDecorator *)self needsAlphaForImage:v74];
    [v60 setOpaque:v75 ^ 1];
    [v60 setScale:1.0];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __62__TVImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke_2;
    v80[3] = &unk_264BA6710;
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    v80[4] = self;
    double v84 = v71;
    double v85 = v73;
    id v81 = v74;
    v76 = +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v60, v80, v71, v73);
    v77 = v76;
    if (v76)
    {
      +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", [v76 CGImage], v75);
      id v66 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v66 = 0;
    }
  }
  else
  {
    double v79 = v11;
    BOOL v28 = (int)[v9 orientation] >= 2 && (int)objc_msgSend(v9, "orientation") < 9;
    [v9 pixelBounds];
    double v30 = v29;
    double v32 = v31;
    if (v28)
    {
      int v33 = [v9 orientation];
      if (v33 <= 4) {
        double v34 = v32;
      }
      else {
        double v34 = v30;
      }
      if (v33 > 4) {
        double v30 = v32;
      }
      double v32 = v34;
    }
    CGFloat v35 = 0.0;
    double v36 = v19 + v22;
    double v37 = v18 + v21;
    double v38 = v19 + 0.0;
    double v39 = v18 + 0.0;
    double v40 = v79 - v36;
    double v41 = v13 - v37;
    switch(self->_scaleMode)
    {
      case 1:
        v100.double width = v30;
        v100.double height = v32;
        v109.origin.CGFloat x = v38;
        v109.origin.CGFloat y = v39;
        v109.size.double width = v40;
        v109.size.double height = v41;
        CGRect v102 = AVMakeRectWithAspectRatioInsideRect(v100, v109);
        CGFloat v42 = v102.size.width;
        double v13 = v102.size.height;
        CGFloat v43 = *MEMORY[0x263F00148];
        CGFloat v35 = *(double *)(MEMORY[0x263F00148] + 8);
        CGFloat v44 = v35;
        uint64_t v45 = *MEMORY[0x263F00148];
        goto LABEL_41;
      case 2:
        v101.double width = v30;
        v101.double height = v32;
        v110.origin.CGFloat x = v38;
        v110.origin.CGFloat y = v39;
        v110.size.double width = v40;
        v110.size.double height = v41;
        *(CGRect *)&uint64_t v45 = AVMakeRectWithAspectRatioInsideRect(v101, v110);
        break;
      case 3:
        v103.origin.CGFloat x = v38;
        v103.origin.CGFloat y = v39;
        v103.size.double width = v40;
        v103.size.double height = v41;
        double v46 = CGRectGetWidth(v103) / v30;
        v104.origin.CGFloat x = v38;
        v104.origin.CGFloat y = v39;
        v104.size.double width = v40;
        v104.size.double height = v41;
        double v47 = CGRectGetHeight(v104) / v32;
        if (v46 >= v47) {
          double v47 = v46;
        }
        double v48 = v30 * v47;
        double v49 = v32 * v47;
        CGFloat v35 = 0.0;
        goto LABEL_39;
      case 4:
        v105.origin.CGFloat x = v38;
        v105.origin.CGFloat y = v39;
        v105.size.double width = v40;
        v105.size.double height = v41;
        double v50 = v30 * (CGRectGetHeight(v105) / v32);
        v106.origin.CGFloat x = v38;
        v106.origin.CGFloat y = v39;
        v106.size.double width = v40;
        v106.size.double height = v41;
        double v49 = CGRectGetHeight(v106);
        double v48 = v50;
LABEL_39:
        +[TVMLUtilities centerRect:inRect:](TVMLUtilities, "centerRect:inRect:", 0.0, 0.0, v48, v49, v38, v39, v40, v41);
        break;
      default:
        uint64_t v45 = *MEMORY[0x263F001A8];
        CGFloat v44 = *(double *)(MEMORY[0x263F001A8] + 8);
        v102.size.double width = *(CGFloat *)(MEMORY[0x263F001A8] + 16);
        v102.size.double height = *(CGFloat *)(MEMORY[0x263F001A8] + 24);
        break;
    }
    CGFloat v43 = 0.0;
    CGFloat v42 = v79;
LABEL_41:
    CGRect v107 = CGRectIntegral(*(CGRect *)&v45);
    CGFloat x = v107.origin.x;
    CGFloat y = v107.origin.y;
    CGFloat v53 = v107.size.width;
    CGFloat v54 = v107.size.height;
    v107.origin.CGFloat x = v43;
    v107.origin.CGFloat y = v35;
    v107.size.double width = v42;
    v107.size.double height = v13;
    CGRect v108 = CGRectIntegral(v107);
    CGFloat v55 = v108.origin.x;
    CGFloat v56 = v108.origin.y;
    double v57 = v108.size.width;
    double v58 = v108.size.height;
    id v59 = v9;
    v60 = +[TVGraphicsImageRenderer formatWithCGImage:](TVGraphicsImageRenderer, "formatWithCGImage:", [v59 image]);
    BOOL v61 = [(TVImageScaleDecorator *)self needsAlphaForImage:v59];
    uint64_t v62 = [(TVImageScaleDecorator *)self bgColor];
    v63 = (void *)v62;
    if (v61)
    {
      BOOL v64 = 1;
    }
    else
    {
      BOOL v64 = 0;
      if (self->_scaleMode == 2 && v62)
      {
        double v98 = 0.0;
        [(UIColor *)self->_bgColor getRed:0 green:0 blue:0 alpha:&v98];
        BOOL v64 = v98 < 1.0;
      }
    }
    [v60 setOpaque:v64 ^ 1];
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __62__TVImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke;
    v86[3] = &unk_264BA66E8;
    v86[4] = self;
    CGFloat v88 = v55;
    CGFloat v89 = v56;
    double v90 = v57;
    double v91 = v58;
    BOOL v96 = v64;
    CGFloat v92 = x;
    CGFloat v93 = y;
    CGFloat v94 = v53;
    CGFloat v95 = v54;
    id v87 = v59;
    BOOL v97 = v28;
    +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v60, v86, v57, v58);
    id v65 = objc_claimAutoreleasedReturnValue();
    +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", [v65 CGImage], v64);
    id v66 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_66:

  return v66;
}

void __62__TVImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(v9, "CGContext"), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (!*(unsigned char *)(a1 + 112)
    || *(void *)(*(void *)(a1 + 32) + 16) == 2 && !CGRectEqualToRect(*(CGRect *)(a1 + 48), *(CGRect *)(a1 + 80)))
  {
    int64_t v3 = [*(id *)(a1 + 32) bgColor];
    unint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x263F1C550] whiteColor];
    }
    uint64_t v6 = v5;

    [v6 setFill];
    UIRectFill(*(CGRect *)(a1 + 48));
  }
  uint64_t v7 = [*(id *)(a1 + 40) uiImage];
  if (*(unsigned char *)(a1 + 113))
  {
    uint64_t v8 = [*(id *)(a1 + 32) _imageFixedForRotation:*(void *)(a1 + 40)];

    uint64_t v7 = (void *)v8;
  }
  objc_msgSend(v7, "drawInRect:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(a1 + 32), "drawInContext:imageRect:", v9, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
}

void __62__TVImageScaleDecorator_decorate_scaledWithSize_croppedToFit___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyCornerMaskForRect:toContext:", objc_msgSend(v4, "CGContext"), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  int64_t v3 = [*(id *)(a1 + 40) uiImage];
  objc_msgSend(v3, "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(a1 + 32), "drawInContext:imageRect:", v4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

- (double)_focusedSizeIncreaseFactor
{
  int64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v3 userInterfaceIdiom] == 2)
  {
    BOOL v4 = [(TVImageScaleDecorator *)self centerGrowth];

    double result = 1.0;
    if (!v4)
    {
      [(TVImageScaleDecorator *)self _scaleToSizeAdjustedForUpscaling];
      double v7 = v6;
      [(TVImageScaleDecorator *)self scaleToSize];
      return v7 / v8;
    }
  }
  else
  {

    return 1.0;
  }
  return result;
}

- (BOOL)needsAlphaForImage:(id)a3
{
  id v4 = a3;
  if ([(TVImageScaleDecorator *)self preservesAlpha])
  {
    if ([v4 hasAlpha])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      [(TVImageScaleDecorator *)self cornerRadii];
      BOOL v5 = !+[TVCornerUtilities radiiIsZero:](TVCornerUtilities, "radiiIsZero:");
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_imageFixedForRotation:(id)a3
{
  id v3 = a3;
  id v4 = +[TVGraphicsImageRenderer formatWithCGImage:](TVGraphicsImageRenderer, "formatWithCGImage:", [v3 image]);
  objc_msgSend(v4, "setOpaque:", objc_msgSend(v3, "hasAlpha") ^ 1);
  [v4 setScale:1.0];
  unsigned int v5 = [v3 orientation];
  [v3 pixelBounds];
  double v7 = v6;
  double v9 = v8;
  [v3 pixelBounds];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__TVImageScaleDecorator__imageFixedForRotation___block_invoke;
  v17[3] = &unk_264BA6738;
  if (v5 <= 4) {
    double v12 = v10;
  }
  else {
    double v12 = v9;
  }
  if (v5 <= 4) {
    double v13 = v11;
  }
  else {
    double v13 = v7;
  }
  double v19 = v12;
  double v20 = v13;
  uint64_t v21 = (int)v5;
  double v22 = v7;
  double v23 = v9;
  id v18 = v3;
  id v14 = v3;
  double v15 = +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v4, v17, v12, v13);

  return v15;
}

void __48__TVImageScaleDecorator__imageFixedForRotation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  CGFloat v4 = 0.0;
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 48));
  CGContextScaleCTM(v3, 1.0, -1.0);
  long long v5 = xmmword_230C37E70;
  long long v6 = xmmword_230C37E80;
  CGFloat v7 = 0.0;
  switch(*(void *)(a1 + 56))
  {
    case 2:
      long long v5 = xmmword_230C37E80;
      long long v6 = xmmword_230C37E90;
      CGFloat v4 = *(double *)(a1 + 64);
      break;
    case 3:
      long long v5 = xmmword_230C37EA0;
      long long v6 = xmmword_230C37E90;
      CGFloat v4 = *(double *)(a1 + 64);
      CGFloat v7 = *(double *)(a1 + 72);
      break;
    case 4:
      long long v5 = xmmword_230C37EA0;
      long long v6 = xmmword_230C37E70;
      CGFloat v7 = *(double *)(a1 + 72);
      break;
    case 5:
      long long v5 = xmmword_230C37E90;
      long long v6 = xmmword_230C37EA0;
      CGFloat v7 = *(double *)(a1 + 64);
      CGFloat v4 = *(double *)(a1 + 72);
      break;
    case 6:
      long long v6 = xmmword_230C37EA0;
      CGFloat v7 = *(double *)(a1 + 64);
      break;
    case 7:
      break;
    case 8:
      long long v5 = xmmword_230C37E90;
      CGFloat v4 = *(double *)(a1 + 72);
      break;
    default:
      long long v6 = *MEMORY[0x263F000D0];
      long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      CGFloat v4 = *(double *)(MEMORY[0x263F000D0] + 32);
      CGFloat v7 = *(double *)(MEMORY[0x263F000D0] + 40);
      break;
  }
  *(_OWORD *)&v11.a = v6;
  *(_OWORD *)&v11.c = v5;
  v11.tCGFloat x = v4;
  v11.tCGFloat y = v7;
  CGContextConcatCTM(v3, &v11);
  CGFloat v8 = *(double *)(a1 + 64);
  CGFloat v9 = *(double *)(a1 + 72);
  double v10 = (CGImage *)[*(id *)(a1 + 32) image];
  v12.origin.CGFloat x = 0.0;
  v12.origin.CGFloat y = 0.0;
  v12.size.double width = v8;
  v12.size.double height = v9;
  CGContextDrawImage(v3, v12, v10);
}

- (CGSize)_scaleToSizeAdjustedForUpscaling
{
  [(TVImageScaleDecorator *)self scaleToSize];
  double v5 = v4;
  double v6 = v3;
  if (v4 > 0.0 && v3 > 0.0)
  {
    [(TVImageScaleDecorator *)self focusedSizeIncrease];
    double v8 = v7;
    if ([(TVImageScaleDecorator *)self centerGrowth])
    {
      double v6 = v6 + v8;
    }
    else
    {
      if (v5 <= v6) {
        double v9 = v6;
      }
      else {
        double v9 = v5;
      }
      double v10 = (v9 + v8) / v9;
      double v5 = floor(v5 * v10);
      double v6 = floor(v6 * v10);
    }
  }
  double v11 = v5;
  double v12 = v6;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UIEdgeInsets)_paddingAdjustedForUpscaling
{
  [(TVImageScaleDecorator *)self padding];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TVImageScaleDecorator *)self _focusedSizeIncreaseFactor];
  if (v11 > 1.0)
  {
    double v4 = floor(v4 * v11);
    double v6 = floor(v6 * v11);
    double v8 = floor(v8 * v11);
    double v10 = floor(v10 * v11);
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)_applyCornerMaskForRect:(CGRect)a3 toContext:(CGContext *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TVImageScaleDecorator *)self _focusedSizeIncreaseFactor];
  double v10 = v9;
  [(TVImageScaleDecorator *)self cornerRadii];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (!+[TVCornerUtilities radiiIsZero:](TVCornerUtilities, "radiiIsZero:"))
  {
    double v19 = +[TVCornerUtilities createPathForRadii:inRect:isContinuous:](TVCornerUtilities, "createPathForRadii:inRect:isContinuous:", [(TVImageScaleDecorator *)self cornerContinuous], v10 * v12, v10 * v14, v10 * v16, v10 * v18, x, y, width, height);
    CGContextAddPath(a4, v19);
    CGPathRelease(v19);
    CGContextClip(a4);
  }
}

- (CGSize)scaleToSize
{
  double width = self->_scaleToSize.width;
  double height = self->_scaleToSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScaleToSize:(CGSize)a3
{
  self->_scaleToSize = a3;
}

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (void)setScaleMode:(int64_t)a3
{
  self->_int64_t scaleMode = a3;
}

- (BOOL)centerGrowth
{
  return self->_centerGrowth;
}

- (void)setCenterGrowth:(BOOL)a3
{
  self->_centerGrowth = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (TVCornerRadii)cornerRadii
{
  double topLeft = self->_cornerRadii.topLeft;
  double topRight = self->_cornerRadii.topRight;
  double bottomLeft = self->_cornerRadii.bottomLeft;
  double bottomRight = self->_cornerRadii.bottomRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topRight = topRight;
  result.double topLeft = topLeft;
  return result;
}

- (void)setCornerRadii:(TVCornerRadii)a3
{
  self->_cornerRadii = a3;
}

- (BOOL)cornerContinuous
{
  return self->_cornerContinuous;
}

- (void)setCornerContinuous:(BOOL)a3
{
  self->_cornerContinuous = a3;
}

- (UIColor)bgColor
{
  return self->_bgColor;
}

- (void)setBgColor:(id)a3
{
}

- (BOOL)preservesAlpha
{
  return self->_preservesAlpha;
}

- (void)setPreservesAlpha:(BOOL)a3
{
  self->_preservesAlpha = a3;
}

- (void).cxx_destruct
{
}

@end