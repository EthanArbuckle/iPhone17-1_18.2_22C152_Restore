@interface UIKeyboardCandidateViewImageRenderer
+ (id)sharedImageRenderer;
- (NSCache)imageCache;
- (UIKeyboardCandidateViewImageRenderer)init;
- (UIView)viewForTraitCollection;
- (id)drawGradientImage:(CGRect)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 applyScale:(BOOL)a6;
- (id)edgeMaskImageForRightSide:(BOOL)a3;
- (id)extensionMaskImage;
- (id)handwritingCellBackgroundImageForDarkKeyboard:(BOOL)a3 highlighted:(BOOL)a4;
- (id)highlightedBarCellBackgroundImageWithColor:(id)a3 insets:(UIEdgeInsets)a4;
- (id)pocketShadowImageForDarkKeyboard:(BOOL)a3 fadesToBottom:(BOOL)a4 drawShadow:(BOOL)a5 topPadding:(double)a6 bottomPadding:(double)a7 height:(double)a8;
- (id)separatorImageWithColor:(id)a3 height:(double)a4;
- (void)setImageCache:(id)a3;
- (void)setViewForTraitCollection:(id)a3;
@end

@implementation UIKeyboardCandidateViewImageRenderer

- (UIKeyboardCandidateViewImageRenderer)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidateViewImageRenderer;
  v2 = [(UIKeyboardCandidateViewImageRenderer *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;
  }
  return v2;
}

+ (id)sharedImageRenderer
{
  if (_MergedGlobals_1109 != -1) {
    dispatch_once(&_MergedGlobals_1109, &__block_literal_global_305);
  }
  v2 = (void *)qword_1EB261590;
  return v2;
}

void __59__UIKeyboardCandidateViewImageRenderer_sharedImageRenderer__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardCandidateViewImageRenderer);
  v1 = (void *)qword_1EB261590;
  qword_1EB261590 = (uint64_t)v0;
}

- (id)highlightedBarCellBackgroundImageWithColor:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v9 = a3;
  v10 = NSString;
  uint64_t v11 = 257 * [v9 hash];
  v12 = [(UIKeyboardCandidateViewImageRenderer *)self viewForTraitCollection];
  v13 = [v12 traitCollection];
  uint64_t v14 = [v13 hash] + v11;
  v43.CGFloat top = top;
  v43.CGFloat left = left;
  v43.CGFloat bottom = bottom;
  v43.CGFloat right = right;
  v15 = NSStringFromUIEdgeInsets(v43);
  v16 = [v10 stringWithFormat:@"HBCB_%lld_%@", v14, v15];

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__119;
  v40 = __Block_byref_object_dispose__119;
  v17 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
  id v41 = [v17 objectForKey:v16];

  v18 = (void *)v37[5];
  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    v20 = [(UIKeyboardCandidateViewImageRenderer *)self viewForTraitCollection];
    v21 = [v20 traitCollection];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      +[UITraitCollection _fallbackTraitCollection]();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    v25 = [v24 _traitCollectionByReplacingNSIntegerValue:1 forTraitToken:0x1ED3F5B20];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__UIKeyboardCandidateViewImageRenderer_highlightedBarCellBackgroundImageWithColor_insets___block_invoke;
    v27[3] = &unk_1E52F3088;
    CGFloat v32 = top;
    CGFloat v33 = left;
    CGFloat v34 = bottom;
    CGFloat v35 = right;
    v31 = &v36;
    id v28 = v9;
    v29 = self;
    id v30 = v16;
    +[UITraitCollection _performWithCurrentTraitCollection:usingBlock:]((uint64_t)UITraitCollection, (uint64_t)v25, (uint64_t)v27);
    id v19 = (id)v37[5];
  }
  _Block_object_dispose(&v36, 8);

  return v19;
}

void __90__UIKeyboardCandidateViewImageRenderer_highlightedBarCellBackgroundImageWithColor_insets___block_invoke(uint64_t a1)
{
  __asm
  {
    FMOV            V0.2D, #10.0
    FMOV            V1.2D, #1.0
  }
  *(float64x2_t *)v18 = vaddq_f64(vaddq_f64(vaddq_f64(*(float64x2_t *)(a1 + 64), _Q0), *(float64x2_t *)(a1 + 80)), _Q1);
  double v8 = UIKBScale();
  _UIGraphicsBeginImageContextWithOptions(0, 0, *(CGFloat *)&v18[1], *(CGFloat *)v18, v8);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v10 = 0;
  }
  else {
    v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSetFillColorWithColor(v10, (CGColorRef)[*(id *)(a1 + 32) CGColor]);
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, *(double *)(a1 + 72), *(double *)(a1 + 64), 11.0, 11.0, 5.0, 5.0);
  id v19 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v10, (CGPathRef)[v19 CGPath]);
  CGContextFillPath(v10);
  uint64_t v11 = _UIGraphicsGetImageFromCurrentImageContext(0);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  UIGraphicsEndImageContext();
  uint64_t v14 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "resizableImageWithCapInsets:resizingMode:", 1, *(double *)(a1 + 64) + 5.0, *(double *)(a1 + 72) + 5.0, *(double *)(a1 + 80) + 5.0, *(double *)(a1 + 88) + 5.0);
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  v17 = [*(id *)(a1 + 40) imageCache];
  [v17 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKey:*(void *)(a1 + 48)];
}

- (id)separatorImageWithColor:(id)a3 height:(double)a4
{
  id v6 = a3;
  v7 = NSString;
  uint64_t v8 = 257 * [v6 hash];
  id v9 = [(UIKeyboardCandidateViewImageRenderer *)self viewForTraitCollection];
  v10 = [v9 traitCollection];
  uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", @"SI_%lld_%g", objc_msgSend(v10, "hash") + v8, *(void *)&a4);

  uint64_t v12 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
  v13 = [v12 objectForKey:v11];

  if (!v13)
  {
    double v14 = UIKBScale();
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0, a4, v14);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v16 = 0;
    }
    else {
      v16 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSetFillColorWithColor(v16, (CGColorRef)[v6 CGColor]);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = 1.0;
    v21.size.height = a4;
    CGContextFillRect(v16, v21);
    v13 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    v17 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
    [v17 setObject:v13 forKey:v11];
  }
  id v18 = v13;

  return v18;
}

- (id)pocketShadowImageForDarkKeyboard:(BOOL)a3 fadesToBottom:(BOOL)a4 drawShadow:(BOOL)a5 topPadding:(double)a6 bottomPadding:(double)a7 height:(double)a8
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v13 = a3;
  if (a4) {
    int v15 = 2;
  }
  else {
    int v15 = 0;
  }
  int v16 = v15 | a3;
  if (a5) {
    int v17 = 4;
  }
  else {
    int v17 = 0;
  }
  id v18 = objc_msgSend(NSString, "stringWithFormat:", @"PSI_%d_%g_%g_%g", v16 | v17, *(void *)&a6, *(void *)&a7, *(void *)&a8);
  id v19 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
  v20 = [v19 objectForKey:v18];

  if (!v20)
  {
    double v21 = 1.0;
    if (v8)
    {
      double v21 = 2.0;
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        if (UIKBScale() == 3.0) {
          double v21 = 2.0;
        }
        else {
          double v21 = 1.5;
        }
      }
    }
    double v22 = UIKBScale();
    _UIGraphicsBeginImageContextWithOptions(0, 0, v21, a8, v22);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v24 = 0;
    }
    else {
      v24 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    double v25 = a8 - a6 - a7;
    if (v9)
    {
      v26 = UIKBCreateFadeClipImage(0, 0, 0.0, a6, v21, a8, 0.0, v25 * 0.75 + a6, v21, v25 * 0.25, 1.0);
      v49.origin.x = 0.0;
      v49.origin.y = a6;
      v49.size.width = v21;
      v49.size.height = a8;
      CGContextClipToMask(v24, v49, v26);
      v50.origin.x = 0.0;
      v50.origin.y = a6;
      v50.size.width = v21;
      v50.size.height = a8;
      CGContextClipToMask(v24, v50, v26);
      CGImageRelease(v26);
    }
    if (v8)
    {
      CGContextSetAlpha(v24, 0.7);
      if (v13)
      {
        v27 = +[UIColor grayColor];
        id v28 = [v27 colorWithAlphaComponent:0.05];
        v29 = (CGColor *)[v28 CGColor];

        id v30 = +[UIColor grayColor];
        id v31 = [v30 colorWithAlphaComponent:0.11];
        CGFloat v32 = (CGColor *)[v31 CGColor];

        CGFloat v33 = +[UIColor grayColor];
        id v34 = [v33 colorWithAlphaComponent:0.31];
        CGFloat v35 = (CGColor *)[v34 CGColor];
      }
      else
      {
        v29 = (CGColor *)UIKBGetNamedColor(@"UIKBColorBlack_Alpha5");
        CGFloat v32 = (CGColor *)UIKBGetNamedColor(@"UIKBColorBlack_Alpha11");
        CGFloat v35 = (CGColor *)UIKBGetNamedColor(@"UIKBColorBlack_Alpha31");
      }
      v51.origin.x = 0.0;
      v51.origin.y = a6;
      v51.size.width = v21;
      v51.size.height = a8;
      CGFloat v39 = CGRectGetMaxX(v51) - v21;
      v52.origin.x = 0.0;
      v52.origin.y = a6;
      v52.size.width = v21;
      v52.size.height = a8;
      CGFloat MinY = CGRectGetMinY(v52);
      CGContextSetFillColorWithColor(v24, v29);
      v53.origin.x = v39;
      v53.origin.y = MinY;
      v53.size.width = v21 / 3.0;
      v53.size.height = v25;
      CGContextFillRect(v24, v53);
      v54.origin.x = 0.0;
      v54.origin.y = a6;
      v54.size.width = v21;
      v54.size.height = a8;
      CGFloat v41 = CGRectGetMaxX(v54) - (v21 + v21) / 3.0;
      v55.origin.x = 0.0;
      v55.origin.y = a6;
      v55.size.width = v21;
      v55.size.height = a8;
      CGFloat v42 = CGRectGetMinY(v55);
      CGContextSetFillColorWithColor(v24, v32);
      v56.origin.x = v41;
      v56.origin.y = v42;
      v56.size.width = v21 / 3.0;
      v56.size.height = v25;
      CGContextFillRect(v24, v56);
      v57.origin.x = 0.0;
      v57.origin.y = a6;
      v57.size.width = v21;
      v57.size.height = a8;
      double v43 = CGRectGetMaxX(v57) - v21 / 3.0;
      v58.origin.x = 0.0;
      v58.origin.y = a6;
      v58.size.width = v21;
      v58.size.height = a8;
      CGFloat v44 = CGRectGetMinY(v58);
      CGContextSetFillColorWithColor(v24, v35);
      double v21 = v21 / 3.0;
    }
    else
    {
      if (v13)
      {
        uint64_t v36 = +[UIColor grayColor];
        id v37 = [v36 colorWithAlphaComponent:0.3];
        uint64_t v38 = (CGColor *)[v37 CGColor];
      }
      else
      {
        uint64_t v38 = (CGColor *)UIKBGetNamedColor(@"UIKBColorBlack_Alpha11");
      }
      double v43 = 0.0;
      v59.origin.x = 0.0;
      v59.origin.y = a6;
      v59.size.width = v21;
      v59.size.height = a8;
      CGFloat v44 = CGRectGetMinY(v59);
      CGContextSetFillColorWithColor(v24, v38);
    }
    v60.origin.x = v43;
    v60.origin.y = v44;
    v60.size.width = v21;
    v60.size.height = v25;
    CGContextFillRect(v24, v60);
    v20 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    v45 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
    [v45 setObject:v20 forKey:v18];
  }
  id v46 = v20;

  return v46;
}

- (id)handwritingCellBackgroundImageForDarkKeyboard:(BOOL)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a4) {
    int v7 = 2;
  }
  else {
    int v7 = 0;
  }
  BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"HWRCB_%d", v7 | a3);
  BOOL v9 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
  v10 = [v9 objectForKey:v8];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    if (v5) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    BOOL v13 = +[UIKBRenderConfig configForAppearance:v12 inputMode:0 traitEnvironment:0];
    double v14 = [UIKBRenderFactory_Candidates alloc];
    int v15 = +[UIKBRenderingContext renderingContextForRenderConfig:v13];
    int v16 = [(UIKBRenderFactory_Candidates *)v14 initWithRenderingContext:v15];

    int v17 = -[UIKBRenderFactory_Candidates traitsForHWRCellSize:highlighted:](v16, "traitsForHWRCellSize:highlighted:", v4, 2.0, 42.0);
    double v18 = UIKBScale();
    id v19 = +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 3, UIKeyboardGetCurrentIdiom(), 2.0, 42.0, v18);
    [v19 setDisableInternalCaching:1];
    [v19 renderBackgroundTraits:v17];
    v20 = [v19 renderedImage];
    double v21 = objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 0.0, 1.0);

    double v22 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
    [v22 setObject:v21 forKey:v8];

    id v11 = v21;
  }

  return v11;
}

- (id)extensionMaskImage
{
  v3 = [NSString stringWithFormat:@"EXTM"];
  BOOL v4 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
  BOOL v5 = [v4 objectForKey:v3];

  if (!v5)
  {
    BOOL v5 = -[UIKeyboardCandidateViewImageRenderer drawGradientImage:startPoint:endPoint:applyScale:](self, "drawGradientImage:startPoint:endPoint:applyScale:", 0, 0.0, 0.0, 1.0, 80.0, 0.0, 0.0, 0.0, 80.0);
    id v6 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
    [v6 setObject:v5 forKey:v3];
  }
  id v7 = v5;

  return v7;
}

- (id)edgeMaskImageForRightSide:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = @"Left";
  if (a3) {
    BOOL v5 = @"Right";
  }
  id v6 = [NSString stringWithFormat:@"SEP-%@", v5];
  id v7 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
  BOOL v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    if (v3) {
      double v9 = 20.0;
    }
    else {
      double v9 = 0.0;
    }
    if (v3) {
      double v10 = 0.0;
    }
    else {
      double v10 = 20.0;
    }
    BOOL v8 = -[UIKeyboardCandidateViewImageRenderer drawGradientImage:startPoint:endPoint:applyScale:](self, "drawGradientImage:startPoint:endPoint:applyScale:", 1, 0.0, 0.0, 20.0, 1.0, v9, 0.0, v10, 0.0);
    id v11 = [(UIKeyboardCandidateViewImageRenderer *)self imageCache];
    [v11 setObject:v8 forKey:v6];
  }
  id v12 = v8;

  return v12;
}

- (id)drawGradientImage:(CGRect)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 applyScale:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat endPoint = a5.y;
  CGFloat x = a5.x;
  CGFloat y = a4.y;
  CGFloat v9 = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!drawGradientImage_startPoint_endPoint_applyScale__colorspace) {
    drawGradientImage_startPoint_endPoint_applyScale__colorspace = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC10]);
  }
  double v14 = UIKBScale();
  *(_OWORD *)components = 0u;
  long long v29 = 0u;
  int v15 = CGColorCreate((CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, components);
  *(_OWORD *)v26 = xmmword_186B98F30;
  long long v27 = unk_186B98F40;
  CGColorRef v16 = CGColorCreate((CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, v26);
  int v17 = CGBitmapContextCreate(0, (unint64_t)(width * v14), (unint64_t)(height * v14), 8uLL, 4 * (unint64_t)(width * v14), (CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, 2u);
  CGAffineTransformMakeScale(&transform, v14, v14);
  CGContextConcatCTM(v17, &transform);
  CGContextSetFillColorWithColor(v17, v15);
  v34.origin.CGFloat x = v13;
  v34.origin.CGFloat y = v12;
  v34.size.double width = width;
  v34.size.double height = height;
  CGContextFillRect(v17, v34);
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v15, v16, 0);
  CFArrayRef v18 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  id v19 = CGGradientCreateWithColors((CGColorSpaceRef)drawGradientImage_startPoint_endPoint_applyScale__colorspace, v18, 0);
  v32.CGFloat x = v9;
  v32.CGFloat y = y;
  v33.CGFloat x = x;
  v33.CGFloat y = endPoint;
  CGContextDrawLinearGradient(v17, v19, v32, v33, 0);
  CGGradientRelease(v19);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  double v21 = 1.0;
  if (v6) {
    double v21 = v14;
  }
  double v22 = +[UIImage imageWithCGImage:Image scale:0 orientation:v21];
  CGImageRelease(Image);

  return v22;
}

- (UIView)viewForTraitCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewForTraitCollection);
  return (UIView *)WeakRetained;
}

- (void)setViewForTraitCollection:(id)a3
{
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_destroyWeak((id *)&self->_viewForTraitCollection);
}

@end