@interface UIKBRenderer
+ (CGContext)imageContextWithSize:(CGSize)a3 scale:(double)a4 colorFormat:(int64_t)a5 opaque:(BOOL)a6 invert:(BOOL)a7;
+ (id)rendererWithContext:(CGContext *)a3 withSize:(CGSize)a4 withScale:(double)a5 opaque:(BOOL)a6 renderFlags:(int64_t)a7 assetIdiom:(int64_t)a8;
+ (void)clearInternalCaches;
- (BOOL)_drawKeyString:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5;
- (BOOL)_drawSingleSymbol:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5;
- (BOOL)colorDetectMode;
- (BOOL)disableInternalCaching;
- (BOOL)loadCachedImageForHashString:(id)a3;
- (BOOL)opaque;
- (BOOL)renderKeyPathContents:(id)a3 withTraits:(id)a4;
- (CGContext)context;
- (CGPath)_deleteGlyphPaths;
- (CGPath)_thickShiftGlyphPath;
- (CGPath)_thinShiftGlyphPath;
- (CGRect)_layerPaddedFrame;
- (CGSize)size;
- (NSData)contextData;
- (NSString)cacheKey;
- (UIColor)singleColor;
- (UIImage)renderedImage;
- (UIKBRenderer)initWithContext:(CGContext *)a3 withSize:(CGSize)a4 withScale:(double)a5 opaque:(BOOL)a6 renderFlags:(int64_t)a7 assetIdiom:(int64_t)a8;
- (double)_layerRoundRectRadius;
- (double)scale;
- (id)defaultPathForRenderGeometry:(id)a3;
- (id)description;
- (id)pathForConcaveCornerWithGeometry:(id)a3;
- (id)pathForFlickGeometry:(id)a3;
- (id)pathForFlickPopupGeometries:(id)a3;
- (id)pathForFlickWidth:(double)a3 height:(double)a4 handleLength:(double)a5 keyMiddle:(CGPoint)a6 angle:(double)a7 radius:(double)a8;
- (id)pathForRenderGeometry:(id)a3;
- (id)pathForSplitGeometry:(id)a3;
- (id)symbolImageConfigForKey:(id)a3 traitCollection:(id)a4;
- (id)watchPathForRenderGeometry:(id)a3;
- (int64_t)assetIdiom;
- (int64_t)contentColorFormat;
- (int64_t)renderFlags;
- (int64_t)symbolImageRenderingModeForIdiom:(int64_t)a3;
- (unint64_t)renderKeyImageContents:(id)a3 withTraits:(id)a4 status:(unint64_t)a5;
- (unint64_t)renderKeyStringContents:(id)a3 withTraits:(id)a4 status:(unint64_t)a5;
- (void)_addDetectedColor:(CGColor *)a3;
- (void)_completeCacheImageWithTraitsIfNecessary:(id)a3;
- (void)_drawKeyImage:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5 force1xImages:(BOOL)a6 flipHorizontally:(BOOL)a7 isRGBImage:(BOOL)a8;
- (void)_drawLinearGradient:(id)a3 inRect:(CGRect)a4;
- (void)_renderVariantsFromKeyContents:(id)a3 withTraits:(id)a4;
- (void)addPathForFlickGeometry:(id)a3;
- (void)addPathForFlickPopupGeometries:(id)a3;
- (void)addPathForRenderGeometry:(id)a3;
- (void)addPathForSplitGeometry:(id)a3;
- (void)addPathForTraits:(id)a3 displayRect:(CGRect *)a4;
- (void)addRoundRect:(CGRect)a3 radius:(double)a4 corners:(unint64_t)a5;
- (void)dealloc;
- (void)detectColorsForEffect:(id)a3;
- (void)detectColorsForGradient:(id)a3;
- (void)detectColorsForNamedColor:(id)a3;
- (void)drawPath:(CGPath *)a3 weight:(double)a4 transform:(CGAffineTransform *)a5 color:(CGColor *)a6 fill:(BOOL)a7;
- (void)drawShiftPath:(BOOL)a3 weight:(double)a4 transform:(CGAffineTransform *)a5 color:(CGColor *)a6;
- (void)ensureContext;
- (void)forceColorFormat:(int64_t)a3;
- (void)renderBackgroundTraits:(id)a3;
- (void)renderBackgroundTraits:(id)a3 allowCaching:(BOOL)a4;
- (void)renderDivotEffect:(id)a3 withTraits:(id)a4;
- (void)renderEdgeEffect:(id)a3 withTraits:(id)a4;
- (void)renderKeyContents:(id)a3 withTraits:(id)a4;
- (void)renderShadowEffect:(id)a3 withTraits:(id)a4;
- (void)setCacheKey:(id)a3;
- (void)setColorDetectMode:(BOOL)a3;
- (void)setDisableInternalCaching:(BOOL)a3;
- (void)set_layerPaddedFrame:(CGRect)a3;
- (void)set_layerRoundRectRadius:(double)a3;
@end

@implementation UIKBRenderer

+ (id)rendererWithContext:(CGContext *)a3 withSize:(CGSize)a4 withScale:(double)a5 opaque:(BOOL)a6 renderFlags:(int64_t)a7 assetIdiom:(int64_t)a8
{
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", a3, a6, a7, a8, a4.width, a4.height, a5);
  return v8;
}

- (UIKBRenderer)initWithContext:(CGContext *)a3 withSize:(CGSize)a4 withScale:(double)a5 opaque:(BOOL)a6 renderFlags:(int64_t)a7 assetIdiom:(int64_t)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v19.receiver = self;
  v19.super_class = (Class)UIKBRenderer;
  v15 = [(UIKBRenderer *)&v19 init];
  if (v15)
  {
    v15->_ctx = CGContextRetain(a3);
    v15->_size.CGFloat width = width;
    v15->_size.CGFloat height = height;
    v15->_scale = a5;
    v15->_opaque = a6;
    v15->_renderFlags = a7;
    v15->_forceColorFormat = 0;
    v15->_colorCount = 0;
    v16 = (CGPoint *)MEMORY[0x1E4F1DB20];
    v15->_contentColorFormat = 1;
    v15->_assetIdiom = a8;
    CGSize v17 = (CGSize)v16[1];
    v15->__layerPaddedFrame.origin = *v16;
    v15->__layerPaddedFrame.size = v17;
    v15->__layerRoundRectRadius = 0.0;
  }
  return v15;
}

- (void)dealloc
{
  cachingContext = self->_cachingContext;
  if (cachingContext) {
    CGContextRelease(cachingContext);
  }
  ctx = self->_ctx;
  if (ctx) {
    CGContextRelease(ctx);
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKBRenderer;
  [(UIKBRenderer *)&v5 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBRenderer;
  v3 = [(UIKBRenderer *)&v6 description];
  objc_msgSend(v3, "stringByAppendingFormat:", @"; renderFlags = %d, forceColors = %d",
    [(UIKBRenderer *)self renderFlags],
  v4 = self->_forceColorFormat);

  return v4;
}

- (void)forceColorFormat:(int64_t)a3
{
  self->_forceColorFormat = a3;
}

- (UIColor)singleColor
{
  if (self->_colorCount == 1) {
    return self->_singleColor;
  }
  else {
    return (UIColor *)0;
  }
}

- (int64_t)contentColorFormat
{
  v3 = [(UIKBRenderer *)self singleColor];

  if (v3) {
    return 2;
  }
  else {
    return self->_contentColorFormat;
  }
}

- (void)_addDetectedColor:(CGColor *)a3
{
  if (!a3 || self->_colorCount > 1) {
    return;
  }
  CopyWithAlpha = CGColorCreateCopyWithAlpha(a3, 1.0);
  UISCreateCachedColorTransform();
  objc_super v5 = (CGColor *)CGColorTransformConvertColor();
  CGColorTransformRelease();
  id v9 = +[UIColor colorWithCGColor:v5];
  CGColorRelease(CopyWithAlpha);
  CGColorRelease(v5);
  int colorCount = self->_colorCount;
  if (colorCount == 1)
  {
    if (![(UIColor *)self->_singleColor isEqual:v9])
    {
      ++self->_colorCount;
      singleColor = self->_singleColor;
      self->_singleColor = 0;
      goto LABEL_9;
    }
  }
  else if (!colorCount)
  {
    self->_int colorCount = 1;
    v7 = (UIColor *)v9;
    singleColor = self->_singleColor;
    self->_singleColor = v7;
LABEL_9:
  }
}

- (void)detectColorsForNamedColor:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v8 = v4;
    objc_super v6 = UIKBGetNamedColor(v4);
    [(UIKBRenderer *)self _addDetectedColor:v6];
    objc_super v5 = v8;
    if (self->_contentColorFormat == 1)
    {
      BOOL v7 = UIKBColorUsesRGB((BOOL)v6);
      objc_super v5 = v8;
      if (v7) {
        self->_contentColorFormat = 0;
      }
    }
  }
}

- (void)detectColorsForGradient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    objc_super v5 = [v4 flatColorName];
    [(UIKBRenderer *)self detectColorsForNamedColor:v5];
    if (self->_contentColorFormat == 1 && [v7 usesRGBColors]) {
      self->_contentColorFormat = 0;
    }
    if (!v5)
    {
      self->_int colorCount = 2;
      singleColor = self->_singleColor;
      self->_singleColor = 0;
    }
    id v4 = v7;
  }
}

- (void)detectColorsForEffect:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v9 = v4;
    objc_super v6 = [v4 gradient];
    [(UIKBRenderer *)self detectColorsForGradient:v6];

    id v7 = (CGColor *)[v9 CGColor];
    [(UIKBRenderer *)self _addDetectedColor:v7];
    CGColorRelease(v7);
    objc_super v5 = v9;
    if (self->_contentColorFormat == 1)
    {
      int v8 = [v9 usesRGBColors];
      objc_super v5 = v9;
      if (v8) {
        self->_contentColorFormat = 0;
      }
    }
  }
}

- (void)ensureContext
{
  if (!self->_cachingContext && !self->_ctx && !self->_colorDetectMode)
  {
    [(UIKBRenderer *)self size];
    double v4 = v3;
    double v6 = v5;
    [(UIKBRenderer *)self scale];
    self->_ctx = +[UIKBRenderer imageContextWithSize:scale:colorFormat:opaque:invert:](UIKBRenderer, "imageContextWithSize:scale:colorFormat:opaque:invert:", self->_forceColorFormat, [(UIKBRenderer *)self opaque], 1, v4, v6, v7);
  }
}

- (CGContext)context
{
  [(UIKBRenderer *)self ensureContext];
  result = self->_cachingContext;
  if (!result) {
    return self->_ctx;
  }
  return result;
}

- (UIImage)renderedImage
{
  renderedImage = self->_renderedImage;
  if (!renderedImage)
  {
    ctx = self->_ctx;
    if (ctx)
    {
      Image = CGBitmapContextCreateImage(ctx);
      double v6 = [UIKBCachedImage alloc];
      [(UIKBRenderer *)self scale];
      double v7 = -[UIImage initWithCGImage:scale:orientation:](v6, "initWithCGImage:scale:orientation:", Image, 0);
      int v8 = [(UIKBRenderer *)self singleColor];
      [(UIImage *)v7 setFormatColor:v8];

      id v9 = self->_renderedImage;
      self->_renderedImage = v7;

      CGImageRelease(Image);
      renderedImage = self->_renderedImage;
    }
    else
    {
      renderedImage = 0;
    }
  }
  v10 = renderedImage;
  return v10;
}

- (NSData)contextData
{
  ctx = self->_ctx;
  if (ctx)
  {
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(ctx);
    size_t v5 = CGBitmapContextGetHeight(self->_ctx) * BytesPerRow;
    ctx = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:CGBitmapContextGetData(self->_ctx) length:v5 freeWhenDone:0];
  }
  return (NSData *)ctx;
}

+ (CGContext)imageContextWithSize:(CGSize)a3 scale:(double)a4 colorFormat:(int64_t)a5 opaque:(BOOL)a6 invert:(BOOL)a7
{
  LODWORD(v8) = vcvtpd_s64_f64(a3.width * a4);
  LODWORD(v7) = vcvtpd_s64_f64(a3.height * a4);
  if ((int)v8 < 1 || (int)v7 < 1) {
    return 0;
  }
  BOOL v11 = a7;
  if (a5 == 2)
  {
    DeviceGray = 0;
    uint32_t v15 = 7;
  }
  else
  {
    BOOL v13 = a6;
    if (a5 == 1)
    {
      DeviceGray = (CGColorSpace *)UIKBColorSpaceDeviceGray_colorspace;
      if (!UIKBColorSpaceDeviceGray_colorspace)
      {
        DeviceGray = CGColorSpaceCreateDeviceGray();
        UIKBColorSpaceDeviceGray_colorspace = (uint64_t)DeviceGray;
      }
      uint32_t v15 = !v13;
    }
    else
    {
      DeviceGray = (CGColorSpace *)UIKBColorSpaceDeviceRGB_colorspace;
      if (!UIKBColorSpaceDeviceRGB_colorspace)
      {
        DeviceGray = CGColorSpaceCreateDeviceRGB();
        UIKBColorSpaceDeviceRGB_colorspace = (uint64_t)DeviceGray;
      }
      if (v13) {
        uint32_t v15 = 8198;
      }
      else {
        uint32_t v15 = 8194;
      }
    }
  }
  Alignedsize_t BytesPerRow = CGBitmapGetAlignedBytesPerRow();
  CGSize v17 = CGBitmapContextCreate(0, v8, v7, 8uLL, AlignedBytesPerRow, DeviceGray, v15);
  v10 = v17;
  if (v17)
  {
    if (v11)
    {
      CGContextTranslateCTM(v17, 0.0, (double)(int)v7);
      CGContextScaleCTM(v10, a4, -a4);
      CGContextGetCTM(&v19, v10);
      CGContextSetBaseCTM();
    }
    else
    {
      CGContextScaleCTM(v17, a4, a4);
    }
  }
  return v10;
}

- (void)renderEdgeEffect:(id)a3 withTraits:(id)a4
{
  id v109 = a3;
  id v6 = a4;
  size_t v7 = [v6 geometry];
  [v7 paddedFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([v109 isValid])
  {
    v111.origin.x = v9;
    v111.origin.y = v11;
    v111.size.CGFloat width = v13;
    v111.size.CGFloat height = v15;
    if (!CGRectIsEmpty(v111))
    {
      if (self->_colorDetectMode)
      {
        [(UIKBRenderer *)self detectColorsForEffect:v109];
        goto LABEL_54;
      }
      v16 = [(UIKBRenderer *)self context];
      uint64_t v17 = [v7 roundRectCorners];
      [v7 roundRectRadius];
      double v108 = v18;
      [v109 insets];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      [v7 displayFrame];
      double v27 = fabs(v20);
      double v106 = v24;
      double v28 = fabs(v22);
      *(double *)v107 = v29 - v28;
      *(double *)&v107[8] = v30 - v27;
      *(double *)&v107[16] = v31 - (-v28 - fabs(v26));
      *(double *)&v107[24] = v32 - (-fabs(v24) - v27);
      if ([v109 edges] == 15)
      {
        if ((unint64_t)(v17 + 1) < 2)
        {
          CGContextSaveGState(v16);
          v33 = (CGColor *)[v109 CGColor];
          CGContextSetStrokeColorWithColor(v16, v33);
          uint64_t v34 = [v6 variantGeometries];
          if (v34)
          {
            v35 = (void *)v34;
            if ([v7 detachedVariants])
            {

LABEL_45:
              if ([v7 flickDirection] != -3)
              {
                v102 = [(UIKBRenderer *)self context];
                v114.origin.x = v9 + -0.25;
                v114.origin.y = v11 + -0.25;
                v114.size.CGFloat width = v13 + 0.5;
                v114.size.CGFloat height = v15 + 0.5;
                CGContextAddRect(v102, v114);
              }
              [(UIKBRenderer *)self addPathForTraits:v6 displayRect:0];
              [v109 weight];
              CGContextSetLineWidth(v16, v103);
              CGContextStrokePath(v16);
              goto LABEL_51;
            }
            uint64_t v97 = [v7 flickDirection];

            if (v97 != -3) {
              goto LABEL_45;
            }
          }
          if ([v7 flickDirection] == -3)
          {
            if (v108 == 0.0 && !v17)
            {
              double v98 = v11 + v20;
              double v99 = v13 - (v22 + v26);
              -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, v9 + v22, v98, v99, v15 - (v20 + v106), 0.0);
              uint64_t v100 = [v109 edges];
              [v109 weight];
              -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, UIRectInsetEdges(v100, v9 + v22, v98, v99, v15 - (v20 + v106), v101));
              CGContextEOClip(v16);
              CGContextSetFillColorWithColor(v16, v33);
              CGContextFillRect(v16, *(CGRect *)v107);
LABEL_51:
              v96 = v33;
              goto LABEL_52;
            }
            v104 = (void *)[v7 copy];
            objc_msgSend(v104, "applyInsets:", v20, v22, v24, v26);
            [(UIKBRenderer *)self addPathForRenderGeometry:v104];
          }
          else
          {
            v104 = (void *)[v7 copy];
            objc_msgSend(v104, "applyInsets:", v20, v22, v24, v26);
            [(UIKBRenderer *)self addPathForFlickGeometry:v104];
          }
          [v109 weight];
          CGContextSetLineWidth(v16, v105);
          CGContextStrokePath(v16);

          goto LABEL_51;
        }
        BOOL v36 = 0;
        BOOL v37 = v108 == 0.0;
      }
      else
      {
        BOOL v36 = v17 == 0;
        BOOL v37 = v108 == 0.0;
        if (v108 == 0.0 && !v17)
        {
          CGContextSaveGState(v16);
          -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, v9, v11, v13, v15, 0.0);
          -[UIKBRenderer addRoundRect:radius:corners:](self, "addRoundRect:radius:corners:", 0, v9 + v22, v11 + v20, v13 - (v22 + v26), v15 - (v20 + v24), 0.0);
          CGContextEOClip(v16);
          v38 = [v109 gradient];

          if (v38)
          {
            v39 = [v109 gradient];
            [v7 displayFrame];
            v44 = self;
            v45 = v39;
LABEL_38:
            -[UIKBRenderer _drawLinearGradient:inRect:](v44, "_drawLinearGradient:inRect:", v45, v40, v41, v42, v43);

LABEL_53:
            CGContextRestoreGState(v16);
            goto LABEL_54;
          }
LABEL_39:
          v95 = (CGColor *)[v109 CGColor];
          CGContextSetFillColorWithColor(v16, v95);
          CGContextFillRect(v16, *(CGRect *)v107);
          v96 = v95;
LABEL_52:
          CGColorRelease(v96);
          goto LABEL_53;
        }
      }
      CGContextSaveGState(v16);
      [v109 insets];
      double v50 = v46;
      double v51 = v47;
      double v52 = v48;
      double v53 = v49;
      if (v37 || v36)
      {
        double v81 = v9 + v47;
        double v82 = v11 + v46;
        double v83 = v13 - (v47 + v49);
        double v84 = v15 - (v46 + v48);
        char v85 = [v109 edges];
        [v109 weight];
        double v87 = UIRectInsetEdges(v85, v81, v82, v83, v84, v86);
        CGFloat v89 = v88;
        CGFloat v91 = v90;
        CGFloat v93 = v92;
        v112.origin.x = v81;
        v112.origin.y = v82;
        v112.size.CGFloat width = v83;
        v112.size.CGFloat height = v84;
        CGContextAddRect(v16, v112);
        v113.origin.x = v87;
        v113.origin.y = v89;
        v113.size.CGFloat width = v91;
        v113.size.CGFloat height = v93;
        CGContextAddRect(v16, v113);
      }
      else
      {
        double v54 = 0.0;
        if ([v7 popupBias]) {
          double v55 = 0.0;
        }
        else {
          double v55 = v50;
        }
        v56 = (void *)[v7 copy];
        [v56 paddedFrame];
        double v59 = v51 + v53;
        objc_msgSend(v56, "setPaddedFrame:", v51 + v57, v55 + v58, v60 - v59, v61 - (v52 + v55));
        [v56 displayFrame];
        objc_msgSend(v56, "setDisplayFrame:", v51 + v62, v50 + v63, v64 - v59, v65 - (v50 + v52));
        [(UIKBRenderer *)self addPathForRenderGeometry:v56];
        char v66 = [v109 edges];
        [v109 weight];
        if (v66) {
          double v68 = v67;
        }
        else {
          double v68 = 0.0;
        }
        if ((v66 & 2) != 0) {
          double v69 = v67;
        }
        else {
          double v69 = 0.0;
        }
        if ((v66 & 4) != 0) {
          double v70 = v67;
        }
        else {
          double v70 = 0.0;
        }
        if ((v66 & 8) != 0) {
          double v71 = v67;
        }
        else {
          double v71 = 0.0;
        }
        if (![v7 popupBias]) {
          double v54 = v68;
        }
        [v56 paddedFrame];
        double v74 = v69 + v71;
        objc_msgSend(v56, "setPaddedFrame:", v69 + v72, v54 + v73, v75 - v74, v76 - (v70 + v54));
        [v56 displayFrame];
        objc_msgSend(v56, "setDisplayFrame:", v69 + v77, v68 + v78, v79 - v74, v80 - (v68 + v70));
        [(UIKBRenderer *)self addPathForRenderGeometry:v56];
      }
      CGContextEOClip(v16);
      v94 = [v109 gradient];

      if (v94)
      {
        v39 = [v109 gradient];
        v44 = self;
        v45 = v39;
        double v40 = *(double *)v107;
        double v41 = *(double *)&v107[8];
        double v42 = *(double *)&v107[16];
        double v43 = *(double *)&v107[24];
        goto LABEL_38;
      }
      goto LABEL_39;
    }
  }
LABEL_54:
}

- (void)renderShadowEffect:(id)a3 withTraits:(id)a4
{
  id v54 = a3;
  id v6 = a4;
  size_t v7 = [v6 geometry];
  if ([v54 isValid])
  {
    [v7 displayFrame];
    if (!CGRectIsEmpty(v57))
    {
      if (self->_colorDetectMode)
      {
        [(UIKBRenderer *)self detectColorsForEffect:v54];
      }
      else
      {
        double v8 = [(UIKBRenderer *)self context];
        CGContextSaveGState(v8);
        double v9 = (CGColor *)[v54 CGColor];
        [v54 offset];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        [v54 weight];
        CGFloat v15 = v14;
        v56.CGFloat width = v11;
        v56.CGFloat height = v13;
        CGContextSetShadowWithColor(v8, v56, v15, v9);
        CGColorRelease(v9);
        id v16 = +[UIColor whiteColor];
        CGContextSetFillColorWithColor(v8, (CGColorRef)[v16 CGColor]);

        id v17 = v6;
        [v54 insets];
        if (v21 != 0.0 || v18 != 0.0 || v20 != 0.0 || v19 != 0.0)
        {
          double v22 = (void *)[v7 copy];
          double v23 = [v17 variantGeometries];
          if (v23 && ![v7 popupBias])
          {
            id v52 = v17;
            double v53 = v22;
            double v24 = [MEMORY[0x1E4F1CA48] array];
            if ([v23 count])
            {
              unint64_t v25 = 0;
              unint64_t v26 = 0x1E4F1C000uLL;
              do
              {
                double v27 = [v23 objectAtIndex:v25];
                double v28 = [*(id *)(v26 + 2712) null];

                if (v27 == v28)
                {
                  v38 = [*(id *)(v26 + 2712) null];
                }
                else
                {
                  if (v25)
                  {
                    [v54 insets];
                    double v30 = v29;
                    double v32 = v31;
                    double v34 = v33;
                    double v36 = v35;
                    switch(v25)
                    {
                      case 1uLL:
                        [v54 concaveInsets];
                        double v34 = -v37;
                        goto LABEL_22;
                      case 2uLL:
                        [v54 concaveInsets];
                        double v32 = -v44;
                        goto LABEL_24;
                      case 3uLL:
                        [v54 concaveInsets];
                        double v30 = -v45;
LABEL_22:
                        [v54 concaveInsets];
                        double v32 = v46;
                        [v54 concaveInsets];
                        double v36 = v47;
                        break;
                      case 4uLL:
                        [v54 concaveInsets];
                        double v36 = -v48;
LABEL_24:
                        [v54 concaveInsets];
                        double v30 = v49;
                        [v54 concaveInsets];
                        double v34 = v50;
                        break;
                      default:
                        break;
                    }
                    double v43 = (void *)[v27 copy];
                    v38 = v43;
                    double v39 = v30;
                    double v40 = v32;
                    double v41 = v34;
                    double v42 = v36;
                  }
                  else
                  {
                    v38 = (void *)[v27 copy];
                    [v54 concaveInsets];
                    double v43 = v38;
                  }
                  objc_msgSend(v43, "applyInsets:", v39, v40, v41, v42);
                }
                [v24 addObject:v38];

                ++v25;
                unint64_t v26 = 0x1E4F1C000;
              }
              while (v25 < [v23 count]);
            }

            id v17 = v52;
            double v22 = v53;
          }
          else
          {
            [v54 insets];
            objc_msgSend(v22, "applyShadowInsets:");
            double v24 = v23;
          }
          double v51 = +[UIKBRenderTraits traitsWithGeometry:v22];

          [v51 setVariantGeometries:v24];
          id v17 = v51;
        }
        [(UIKBRenderer *)self addPathForTraits:v17 displayRect:0];
        CGContextFillPath(v8);
        CGContextRestoreGState(v8);
      }
    }
  }
}

- (void)renderDivotEffect:(id)a3 withTraits:(id)a4
{
  id v5 = a4;
  id v6 = _UIImageWithName(@"spacekey_grabber_handles.png");
  size_t v7 = [v5 geometry];

  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  [v6 size];
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v20 = v11 + (v15 - v18) * 0.5 + -1.0;
  double v21 = [(UIKBRenderer *)self context];
  id v22 = v6;
  double v23 = (CGImage *)[v22 CGImage];
  v27.origin.x = v9 + 8.0;
  v27.origin.y = v20;
  v27.size.CGFloat width = v17;
  v27.size.CGFloat height = v19;
  CGContextDrawImage(v21, v27, v23);
  id v25 = v22;
  double v24 = (CGImage *)[v25 CGImage];
  v28.origin.x = v9 + v13 - v17 + -8.0;
  v28.origin.y = v20;
  v28.size.CGFloat width = v17;
  v28.size.CGFloat height = v19;
  CGContextDrawImage(v21, v28, v24);
}

- (void)_drawLinearGradient:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (v9)
  {
    id v13 = v9;
    if ([v9 horizontal])
    {
      double v10 = -0.0;
    }
    else
    {
      double width = -0.0;
      double v10 = height;
    }
    double v11 = (CGGradient *)[v13 CGGradient];
    if (self->_colorDetectMode)
    {
      [(UIKBRenderer *)self detectColorsForGradient:v13];
    }
    else if ([(UIKBRenderer *)self context])
    {
      double v12 = [(UIKBRenderer *)self context];
      v15.double x = x;
      v15.double y = y;
      v16.double x = x + width;
      v16.double y = y + v10;
      CGContextDrawLinearGradient(v12, v11, v15, v16, 0);
    }
    CGGradientRelease(v11);
    id v9 = v13;
  }
}

+ (void)clearInternalCaches
{
  v2 = (void *)_MergedGlobals_1124;
  _MergedGlobals_1124 = 0;
}

- (void)renderBackgroundTraits:(id)a3 allowCaching:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(UIKBRenderer *)self renderFlags];
  unint64_t v8 = [(UIKBRenderer *)self renderFlags];
  unint64_t v64 = [(UIKBRenderer *)self renderFlags];
  double v65 = [v6 backgroundGradient];
  double v67 = [v6 layeredBackgroundGradient];
  double v68 = [v6 layeredForegroundGradient];
  char v66 = [v6 renderEffects];
  int v9 = v7 & 1;
  uint64_t v10 = (v8 >> 1) & 1;
  if ([v6 blendForm] != 3) {
    goto LABEL_9;
  }
  if ([(UIKBRenderer *)self renderFlags] == 2)
  {
    LODWORD(v10) = 0;
    int v9 = 1;
    goto LABEL_9;
  }
  if ([(UIKBRenderer *)self renderFlags] == 1)
  {

    uint64_t v11 = [v6 foregroundRenderEffects];
    double v65 = v68;
  }
  else
  {
    if ([(UIKBRenderer *)self renderFlags] != 4) {
      goto LABEL_9;
    }

    uint64_t v11 = 0;
  }

  double v68 = 0;
  char v66 = (void *)v11;
LABEL_9:
  if (v67) {
    int v12 = v10;
  }
  else {
    int v12 = 0;
  }
  unsigned int v13 = (v68 != 0) & (v64 >> 2);
  if ([v6 blendForm] == 1) {
    v13 &= ~[v6 controlOpacities];
  }
  if (((v9 | v10 | v12) & 1) == 0 && !v13) {
    goto LABEL_92;
  }
  int v60 = v12;
  double v14 = [v6 geometry];
  [v14 displayFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v83.origin.double x = v15;
  v83.origin.double y = v17;
  v83.size.double width = v19;
  v83.size.double height = v21;

  char v23 = [(UIKBRenderer *)self renderFlags];
  if (self->_colorDetectMode) {
    goto LABEL_17;
  }
  char v25 = v23;
  double v61 = 0;
  if (![(UIKBRenderer *)self disableInternalCaching])
  {
    uint64_t v26 = v25 & 3;
    if ((v25 & 3) != 0 && v4)
    {
      CGRect v27 = [v6 hashString];
      if (!v27 || (cachingContext = self->_cachingContext, v27, cachingContext))
      {
LABEL_17:
        double v61 = 0;
        goto LABEL_18;
      }
      if (qword_1EB261948 != -1) {
        dispatch_once(&qword_1EB261948, &__block_literal_global_330);
      }
      double v29 = [v6 hashString];
      double v61 = objc_msgSend(v29, "stringByAppendingFormat:", @"%d", v26);

      double v30 = [(id)_MergedGlobals_1124 objectForKey:v61];
      if (v30)
      {
        CGBlendMode BlendMode = CGContextGetBlendMode();
        CGContextSetBlendMode(self->_ctx, kCGBlendModeCopy);
        ctdouble x = self->_ctx;
        id v33 = v30;
        double v34 = (CGImage *)[v33 CGImage];
        v87.origin.double x = v16;
        v87.origin.double y = v18;
        v87.size.double width = v20;
        v87.size.double height = v22;
        CGContextDrawImage(ctx, v87, v34);
        CGContextSetBlendMode(self->_ctx, BlendMode);
        id v35 = v33;
        [v35 CGImage];
        double v36 = CGImageGetProperty();
        uint64_t v37 = [v36 integerValue];
        if (v37 < self->_contentColorFormat) {
          self->_contentColorFormat = v37;
        }
        if ([v35 hasFormatColor])
        {
          id v38 = [v35 formatColor];
          -[UIKBRenderer _addDetectedColor:](self, "_addDetectedColor:", [v38 CGColor]);
        }
        id v39 = v61;
        goto LABEL_91;
      }
      CGSize v56 = objc_opt_class();
      [(UIKBRenderer *)self scale];
      double v58 = (CGContext *)objc_msgSend(v56, "imageContextWithSize:scale:colorFormat:opaque:invert:", self->_forceColorFormat, 0, 0, v20, v22, v57);
      self->_cachingContext = v58;
      CGAffineTransformMakeTranslation(&transform, -v16, -v18);
      CGContextConcatCTM(v58, &transform);
    }
  }
LABEL_18:
  if (v9)
  {
    BOOL v24 = ([v6 blurBlending] & 1) != 0 || objc_msgSend(v6, "blendForm") == 3;
    int v63 = v24;
    if (!v10) {
      goto LABEL_39;
    }
  }
  else
  {
    int v63 = 0;
    if (!v10) {
      goto LABEL_39;
    }
  }
  if (([v6 blurBlending] & 1) == 0)
  {
    LODWORD(v62) = [v6 blendForm] != 3;
    goto LABEL_41;
  }
LABEL_39:
  LODWORD(v62) = 0;
LABEL_41:
  if ([v6 renderFlagsForAboveEffects])
  {
    unint64_t v40 = [v6 renderFlagsForAboveEffects];
    BOOL v59 = ([(UIKBRenderer *)self renderFlags] & v40) != 0;
    uint64_t v62 = (v40 >> 1) & 1;
    int v63 = v40 & 1;
    if (!v10) {
      goto LABEL_63;
    }
  }
  else
  {
    BOOL v59 = 0;
    if (!v10) {
      goto LABEL_63;
    }
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v41 = v66;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v78 objects:v85 count:16];
  if (!v42)
  {

    goto LABEL_63;
  }
  char v43 = 0;
  uint64_t v44 = *(void *)v79;
  do
  {
    uint64_t v45 = 0;
    do
    {
      if (*(void *)v79 != v44) {
        objc_enumerationMutation(v41);
      }
      double v46 = *(void **)(*((void *)&v78 + 1) + 8 * v45);
      if ([v46 renderUnder])
      {
        if (v43) {
          goto LABEL_54;
        }
        if ([(UIKBRenderer *)self context])
        {
          CGContextSaveGState([(UIKBRenderer *)self context]);
          double v47 = [(UIKBRenderer *)self context];
          CGContextAddRect(v47, v83);
          [(UIKBRenderer *)self addPathForTraits:v6 displayRect:0];
          CGContextEOClip([(UIKBRenderer *)self context]);
LABEL_54:
          char v43 = 1;
        }
        else
        {
          char v43 = 0;
        }
        [v46 renderEffectWithRenderer:self traits:v6];
      }
      ++v45;
    }
    while (v42 != v45);
    uint64_t v48 = [v41 countByEnumeratingWithState:&v78 objects:v85 count:16];
    uint64_t v42 = v48;
  }
  while (v48);

  if (v43) {
    CGContextRestoreGState([(UIKBRenderer *)self context]);
  }
LABEL_63:
  if (v9 | v60 | v13)
  {
    if ([(UIKBRenderer *)self context])
    {
      CGContextSaveGState([(UIKBRenderer *)self context]);
      [(UIKBRenderer *)self addPathForTraits:v6 displayRect:&v83];
      if (!CGContextIsPathEmpty([(UIKBRenderer *)self context])) {
        CGContextClip([(UIKBRenderer *)self context]);
      }
    }
    if (v60) {
      -[UIKBRenderer _drawLinearGradient:inRect:](self, "_drawLinearGradient:inRect:", v67, *(_OWORD *)&v83.origin, *(_OWORD *)&v83.size);
    }
    if (v9) {
      -[UIKBRenderer _drawLinearGradient:inRect:](self, "_drawLinearGradient:inRect:", v65, *(_OWORD *)&v83.origin, *(_OWORD *)&v83.size);
    }
    if (v13) {
      -[UIKBRenderer _drawLinearGradient:inRect:](self, "_drawLinearGradient:inRect:", v68, *(_OWORD *)&v83.origin, *(_OWORD *)&v83.size);
    }
    if ([(UIKBRenderer *)self context]) {
      CGContextRestoreGState([(UIKBRenderer *)self context]);
    }
  }
  if ((v62 | v63 | v59) == 1)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v49 = v66;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(v49);
          }
          double v53 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          if (([v53 renderUnder] & 1) == 0) {
            [v53 renderEffectWithRenderer:self traits:v6];
          }
        }
        uint64_t v50 = [v49 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }
      while (v50);
    }
  }
  id v39 = v61;
  if (v61 && !self->_cachingContextCompletion)
  {
    objc_initWeak(&location, self);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __52__UIKBRenderer_renderBackgroundTraits_allowCaching___block_invoke_2;
    v69[3] = &unk_1E52FA348;
    objc_copyWeak(&v71, &location);
    v69[4] = self;
    id v39 = v61;
    id v70 = v39;
    CGRect v72 = v83;
    id v54 = (void *)[v69 copy];
    id cachingContextCompletion = self->_cachingContextCompletion;
    self->_id cachingContextCompletion = v54;

    if ((v64 >> 2)) {
      [(UIKBRenderer *)self _completeCacheImageWithTraitsIfNecessary:v6];
    }

    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);
  }
LABEL_91:

LABEL_92:
}

uint64_t __52__UIKBRenderer_renderBackgroundTraits_allowCaching___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_MergedGlobals_1124;
  _MergedGlobals_1124 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_1124;
  return [v2 setCountLimit:50];
}

void __52__UIKBRenderer_renderBackgroundTraits_allowCaching___block_invoke_2(uint64_t a1)
{
  WeakRetained = (CGContextRef *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v7 = WeakRetained;
    Image = CGBitmapContextCreateImage(WeakRetained[1]);
    CGContextRelease(v7[1]);
    v7[1] = 0;
    if (Image)
    {
      [NSNumber numberWithInteger:v7[11]];
      CGImageSetProperty();
      BOOL v4 = [(UIImage *)[UIKBCachedImage alloc] initWithCGImage:Image];
      if ([*(id *)(a1 + 32) contentColorFormat] == 2)
      {
        id v5 = [(CGContextRef *)v7 singleColor];
        [(UIKBCachedImage *)v4 setFormatColor:v5];
      }
      [(id)_MergedGlobals_1124 setObject:v4 forKey:*(void *)(a1 + 40)];
      CGBlendMode BlendMode = CGContextGetBlendMode();
      CGContextSetBlendMode(v7[6], kCGBlendModeCopy);
      CGContextDrawImage(v7[6], *(CGRect *)(a1 + 56), Image);
      CGContextSetBlendMode(v7[6], BlendMode);
    }
    CGImageRelease(Image);
    WeakRetained = v7;
  }
}

- (BOOL)loadCachedImageForHashString:(id)a3
{
  id v4 = a3;
  BOOL v5 = 0;
  if (v4 && _MergedGlobals_1124)
  {
    id v6 = [(UIKBRenderer *)self cacheKey];

    if (v6)
    {
      BOOL v5 = 0;
    }
    else
    {
      char v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[UIKBRenderer renderFlags](self, "renderFlags"));
      unint64_t v8 = [v7 stringValue];
      int v9 = [v4 stringByAppendingString:v8];

      uint64_t v10 = [(id)_MergedGlobals_1124 objectForKey:v9];
      if (v10)
      {
        uint64_t v11 = [UIKBCachedImage alloc];
        uint64_t v12 = [v10 CGImage];
        [(UIKBRenderer *)self scale];
        unsigned int v13 = -[UIImage initWithCGImage:scale:orientation:](v11, "initWithCGImage:scale:orientation:", v12, 1);
        renderedImage = self->_renderedImage;
        self->_renderedImage = v13;
      }
      BOOL v5 = self->_renderedImage != 0;
    }
  }

  return v5;
}

- (void)_completeCacheImageWithTraitsIfNecessary:(id)a3
{
  id v4 = [a3 hashString];
  if (v4)
  {
    id cachingContextCompletion = self->_cachingContextCompletion;

    if (cachingContextCompletion)
    {
      (*((void (**)(void))self->_cachingContextCompletion + 2))();
      id v6 = self->_cachingContextCompletion;
      self->_id cachingContextCompletion = 0;
    }
  }
}

- (void)renderBackgroundTraits:(id)a3
{
  id v4 = a3;
  [(UIKBRenderer *)self ensureContext];
  [(UIKBRenderer *)self renderBackgroundTraits:v4 allowCaching:0];
}

- (void)renderKeyContents:(id)a3 withTraits:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(UIKBRenderer *)self ensureContext];
  ctdouble x = self->_ctx;
  if (ctx) {
    CGContextSaveGState(ctx);
  }
  [(UIKBRenderer *)self renderBackgroundTraits:v7 allowCaching:1];
  if ([v6 stringKeycapOverImage])
  {
    unint64_t v9 = [(UIKBRenderer *)self renderKeyStringContents:v6 withTraits:v7 status:0];
    if (v9 != 3
      && ![(UIKBRenderer *)self renderKeyImageContents:v6 withTraits:v7 status:v9])
    {
LABEL_9:
      [(UIKBRenderer *)self renderKeyPathContents:v6 withTraits:v7];
    }
  }
  else
  {
    unint64_t v10 = [(UIKBRenderer *)self renderKeyImageContents:v6 withTraits:v7 status:0];
    if (v10 != 3
      && ![(UIKBRenderer *)self renderKeyStringContents:v6 withTraits:v7 status:v10])
    {
      goto LABEL_9;
    }
  }
  uint64_t v11 = self->_ctx;
  if (v11) {
    CGContextRestoreGState(v11);
  }
  uint64_t v12 = [v7 geometry];
  if (!v12
    || (unsigned int v13 = (void *)v12,
        [v7 geometry],
        double v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 flickDirection],
        v14,
        v13,
        v15 == -3))
  {
    double v16 = [v6 variantDisplayContents];

    [(UIKBRenderer *)self _completeCacheImageWithTraitsIfNecessary:v7];
    if (!v16) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v17 = [v7 variantGeometries];
  if (v17)
  {
    double v18 = (void *)v17;
    CGFloat v19 = [v6 variantDisplayContents];

    if (v19)
    {
      [(UIKBRenderer *)self _completeCacheImageWithTraitsIfNecessary:v7];
LABEL_19:
      [(UIKBRenderer *)self _renderVariantsFromKeyContents:v6 withTraits:v7];
      goto LABEL_20;
    }
  }
  double v20 = [v7 variantTraits];
  CGFloat v21 = [v20 geometry];

  if (v21)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v22 = objc_msgSend(v6, "highlightedVariantsList", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          CGRect v27 = *(void **)(*((void *)&v31 + 1) + 8 * v26);
          CGRect v28 = [v6 variantDisplayContents];
          double v29 = objc_msgSend(v28, "objectAtIndex:", objc_msgSend(v27, "unsignedIntegerValue"));

          double v30 = [v7 variantTraits];
          [(UIKBRenderer *)self renderKeyContents:v29 withTraits:v30];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v24);
    }

    [(UIKBRenderer *)self _completeCacheImageWithTraitsIfNecessary:v7];
  }
LABEL_20:
}

- (void)_renderVariantsFromKeyContents:(id)a3 withTraits:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 variantDisplayContents];
  uint64_t v8 = [v7 count];
  unint64_t v9 = [v6 variantGeometries];
  uint64_t v10 = [v9 count];

  if (v8 != v10)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v5;
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "keyboard: number of popups didn't match number of geometries: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_renderVariantsFromKeyContents_withTraits____s_category)+ 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v5;
        _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "keyboard: number of popups didn't match number of geometries: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v11 = [v5 variantDisplayContents];
  unint64_t v12 = [v11 count];

  unsigned int v13 = [v6 variantGeometries];
  unint64_t v14 = [v13 count];

  if (v12 >= v14) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      uint64_t v17 = [v5 variantDisplayContents];
      double v18 = [v17 objectAtIndex:i];

      CGFloat v19 = [MEMORY[0x1E4F1CA98] null];

      if (v18 != v19)
      {
        double v20 = [v5 highlightedVariantsList];
        CGFloat v21 = [NSNumber numberWithUnsignedInteger:i];
        if ([v20 containsObject:v21]) {
          [v6 highlightedVariantTraits];
        }
        else {
        double v22 = [v6 variantTraits];
        }

        uint64_t v23 = [v6 variantGeometries];
        uint64_t v24 = [v23 objectAtIndex:i];
        [v22 setGeometry:v24];

        [(UIKBRenderer *)self renderKeyContents:v18 withTraits:v22];
      }
    }
  }
}

- (void)_drawKeyImage:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5 force1xImages:(BOOL)a6 flipHorizontally:(BOOL)a7 isRGBImage:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v63 = a3;
  id v17 = a5;
  BOOL colorDetectMode = self->_colorDetectMode;
  CGFloat v19 = [v17 textColor];
  double v20 = v19;
  if (!colorDetectMode)
  {
    CGFloat v21 = UIKBGetNamedColor(v19);

    double v20 = +[UIColor colorWithCGColor:v21];
    [v17 textOpacity];
    if (v22 != 1.0)
    {
      [v17 textOpacity];
      uint64_t v23 = objc_msgSend(v20, "colorWithAlphaComponent:");

      double v20 = (void *)v23;
    }
    if (v8)
    {
      id v24 = v63;
    }
    else
    {
      id v24 = [v63 _flatImageWithColor:v20];
    }
    uint64_t v25 = v24;
    [v63 scale];
    double v27 = v26;
    [v25 size];
    double v29 = v28;
    double v31 = v30;
    if ([v63 isSymbolImage])
    {
      [v63 contentInsets];
      double v33 = v32;
      [v63 contentInsets];
      double v31 = v31 - (v33 + v34);
      [v63 contentInsets];
      double v36 = v35;
      [v63 contentInsets];
      double v29 = v29 - (v36 + v37);
    }
    if (v10) {
      double v38 = v27;
    }
    else {
      double v38 = 1.0;
    }
    double v39 = v38 * v31;
    double v40 = v38 * v29;
    if (v40 > width || v39 > height)
    {
      double v42 = width / v40;
      if (width / v40 >= height / v39) {
        double v42 = height / v39;
      }
      double v40 = v40 * v42;
      double v39 = v39 * v42;
    }
    [v17 imageScale];
    if (v43 != 1.0)
    {
      [v17 imageScale];
      double v40 = v40 * v44;
      [v17 imageScale];
      double v39 = v39 * v45;
    }
    if (![v17 anchorCorner])
    {
      float v49 = v27 * (width - v40) * 0.5;
      double v50 = x + fabsf(roundf(v49)) / v27;
      [v17 textOffset];
      double v47 = v50 + v51;
      *(float *)&double v51 = v27 * (height - v39) * 0.5;
      double v48 = fabsf(roundf(*(float *)&v51)) / v27 - y;
      goto LABEL_27;
    }
    if ([v17 anchorCorner] == 1)
    {
      [v17 textOffset];
      double v47 = x + v46;
LABEL_25:
      double v48 = height - y - v39;
LABEL_27:
      [v17 textOffset];
      double y = v52;
LABEL_35:
      double v55 = v48 - y;
      goto LABEL_36;
    }
    if ([v17 anchorCorner] == 4)
    {
      [v17 textOffset];
      double v47 = x + v53;
    }
    else
    {
      if ([v17 anchorCorner] == 2)
      {
        [v17 textOffset];
        double v47 = x + width - v40 - v54;
        goto LABEL_25;
      }
      double v55 = 0.0;
      double v47 = 0.0;
      if ([v17 anchorCorner] != 8)
      {
LABEL_36:
        if (v9) {
          double v58 = -v47 - v40;
        }
        else {
          double v58 = v47;
        }
        if (v9) {
          double v59 = -1.0;
        }
        else {
          double v59 = 1.0;
        }
        CGContextSaveGState(self->_ctx);
        CGContextTranslateCTM(self->_ctx, 0.0, height);
        CGContextScaleCTM(self->_ctx, v59, -1.0);
        ctdouble x = self->_ctx;
        id v61 = v25;
        uint64_t v62 = (CGImage *)[v61 CGImage];
        v65.origin.double x = v58;
        v65.origin.double y = v55;
        v65.size.double width = v40;
        v65.size.double height = v39;
        CGContextDrawImage(ctx, v65, v62);
        CGContextRestoreGState(self->_ctx);

        goto LABEL_43;
      }
      [v17 textOffset];
      double v47 = x + width - v40 - v56;
    }
    [v17 textOffset];
    double v48 = v57;
    goto LABEL_35;
  }
  [(UIKBRenderer *)self detectColorsForNamedColor:v19];
LABEL_43:
}

- (unint64_t)renderKeyImageContents:(id)a3 withTraits:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  unint64_t v64 = a5;
  if (([(UIKBRenderer *)self renderFlags] & 0x34) != 0)
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke;
    v59[3] = &unk_1E52F18D0;
    v59[4] = self;
    id v10 = v9;
    id v60 = v10;
    double v51 = +[UITraitCollection traitCollectionWithTraits:v59];
    if ((a5 & 2) == 0)
    {
      uint64_t v11 = [v8 secondaryDisplayStringImages];
      if ([v11 count])
      {
        unint64_t v12 = [v10 secondarySymbolStyles];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          unint64_t v14 = [v8 secondaryDisplayStringImages];
          unint64_t v15 = [v14 count];

          double v16 = [v10 secondarySymbolStyles];
          unint64_t v17 = [v16 count];

          if ([v10 renderSecondarySymbolsSeparately])
          {
            if (([(UIKBRenderer *)self renderFlags] & 0x20) != 0)
            {
              unint64_t v18 = 1;
              goto LABEL_32;
            }
            if (([(UIKBRenderer *)self renderFlags] & 0x10) != 0)
            {
              unint64_t v18 = 0;
LABEL_32:
              if (v18 >= v15)
              {
                id v41 = 0;
                double v40 = 0;
              }
              else
              {
                double v39 = [v8 secondaryDisplayStringImages];
                double v40 = [v39 objectAtIndex:v18];

                if (v40)
                {
                  id v41 = _UIImageWithNameAndTraitCollection(v40, v51);
                }
                else
                {
                  id v41 = 0;
                }
              }
              if (v18 >= v17
                || ([v10 secondarySymbolStyles],
                    double v42 = objc_claimAutoreleasedReturnValue(),
                    [v42 objectAtIndex:v18],
                    double v43 = objc_claimAutoreleasedReturnValue(),
                    v42,
                    !v43))
              {
                double v44 = [v10 secondarySymbolStyles];
                double v43 = [v44 lastObject];
              }
              if (v41)
              {
                double v45 = [v10 geometry];
                [v45 symbolFrame];
                -[UIKBRenderer _drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:](self, "_drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:", v41, v43, [v8 force1xImages], objc_msgSend(v8, "flipImageHorizontally"), 0, v46, v47, v48, v49);

                v62[3] = 3;
              }
            }
          }
          else
          {
            double v33 = [v8 secondaryDisplayStringImages];
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke_2;
            v52[3] = &unk_1E52FA370;
            v52[4] = self;
            uint64_t v57 = 52;
            unint64_t v58 = v17;
            id v53 = v10;
            id v54 = v51;
            id v55 = v8;
            double v56 = &v61;
            [v33 enumerateObjectsUsingBlock:v52];
          }
LABEL_43:
          unint64_t v19 = v62[3];
          goto LABEL_44;
        }
      }
      else
      {
      }
    }
    if (a5) {
      goto LABEL_43;
    }
    double v20 = [v8 displayStringImage];
    CGFloat v21 = [v10 symbolStyle];
    if ([v21 usesSymbolImage])
    {
      double v22 = [(UIKBRenderer *)self symbolImageConfigForKey:v10 traitCollection:v51];
      uint64_t v23 = [v8 bundlePathOverride];

      if (v23)
      {
        id v24 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v25 = [v8 bundlePathOverride];
        double v26 = [v24 bundleWithPath:v25];

        double v27 = +[UIImage imageNamed:v20 inBundle:v26 withConfiguration:v22];
        double v28 = objc_msgSend(v27, "imageWithRenderingMode:", -[UIKBRenderer symbolImageRenderingModeForIdiom:](self, "symbolImageRenderingModeForIdiom:", -[UIKBRenderer assetIdiom](self, "assetIdiom")));
      }
      else
      {
        double v26 = +[UIImage _systemImageNamed:v20 withConfiguration:v22];
        double v28 = objc_msgSend(v26, "imageWithRenderingMode:", -[UIKBRenderer symbolImageRenderingModeForIdiom:](self, "symbolImageRenderingModeForIdiom:", -[UIKBRenderer assetIdiom](self, "assetIdiom")));
      }
    }
    else
    {
      double v29 = [v8 displayImage];

      if (v29)
      {
        double v28 = [v8 displayImage];
        uint64_t v30 = 1;
        if (v28) {
          goto LABEL_24;
        }
        goto LABEL_17;
      }
      double v28 = _UIImageWithNameAndTraitCollection(v20, v51);
    }
    uint64_t v30 = 0;
    if (v28)
    {
LABEL_24:
      double v32 = v20;
      if (!v28) {
        goto LABEL_30;
      }
      goto LABEL_28;
    }
LABEL_17:
    double v31 = [v8 fallbackContents];
    double v32 = [v31 displayStringImage];

    if ([v21 usesSymbolImage]) {
      +[UIImage systemImageNamed:v32 compatibleWithTraitCollection:v51];
    }
    else {
    double v28 = _UIImageWithNameAndTraitCollection(v32, v51);
    }
    if (!v28) {
      goto LABEL_30;
    }
LABEL_28:
    if (v21)
    {
      double v34 = [v10 geometry];
      [v34 symbolFrame];
      -[UIKBRenderer _drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:](self, "_drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:", v28, v21, [v8 force1xImages], objc_msgSend(v8, "flipImageHorizontally"), v30, v35, v36, v37, v38);

      v62[3] = 3;
      goto LABEL_43;
    }
LABEL_30:
    unint64_t v19 = v62[3];

LABEL_44:
    goto LABEL_45;
  }
  unint64_t v19 = v62[3];
LABEL_45:
  _Block_object_dispose(&v61, 8);

  return v19;
}

void __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setUserInterfaceIdiom:", objc_msgSend(v3, "assetIdiom"));
  [*(id *)(a1 + 32) scale];
  objc_msgSend(v5, "setDisplayScale:");
  if ([*(id *)(a1 + 40) usesDarkAppearance]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setUserInterfaceStyle:v4];
  [v5 setLayoutDirection:0];
}

void __57__UIKBRenderer_renderKeyImageContents_withTraits_status___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v15 = a2;
  if ([v15 length] && (*(void *)(a1 + 72) & objc_msgSend(*(id *)(a1 + 32), "renderFlags")) != 0)
  {
    if (*(void *)(a1 + 80) <= a3
      || ([*(id *)(a1 + 40) secondarySymbolStyles],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [v5 objectAtIndex:a3],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v6))
    {
      id v7 = [*(id *)(a1 + 40) secondarySymbolStyles];
      id v6 = [v7 lastObject];
    }
    id v8 = _UIImageWithNameAndTraitCollection(v15, *(void **)(a1 + 48));
    if (v8)
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) geometry];
      [v10 symbolFrame];
      objc_msgSend(v9, "_drawKeyImage:inRect:withStyle:force1xImages:flipHorizontally:isRGBImage:", v8, v6, objc_msgSend(*(id *)(a1 + 56), "force1xImages"), objc_msgSend(*(id *)(a1 + 56), "flipImageHorizontally"), 0, v11, v12, v13, v14);

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= 2uLL;
    }
  }
}

- (id)symbolImageConfigForKey:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 symbolStyle];
  [v7 fontWeightForSymbolImage];
  uint64_t v8 = UISIndexForFontWeight();

  if (!v8)
  {
    id v9 = [v5 symbolStyle];
    [v9 fontWeight];
    uint64_t v10 = UISIndexForFontWeight();

    if (v10) {
      uint64_t v8 = v10;
    }
    else {
      uint64_t v8 = 4;
    }
  }
  double v11 = [v5 symbolStyle];
  [v11 fontSizeForSymbolImage];
  double v13 = v12;

  if (v13 == 0.0)
  {
    double v14 = [v5 symbolStyle];
    [v14 fontSize];
    double v13 = v15;
  }
  double v16 = [v5 symbolStyle];
  unint64_t v17 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", v8, [v16 symbolScale], v13);

  unint64_t v18 = [v17 configurationWithTraitCollection:v6];

  return v18;
}

- (int64_t)symbolImageRenderingModeForIdiom:(int64_t)a3
{
  return 2 * (a3 != 2);
}

- (BOOL)_drawSingleSymbol:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  if ([v11 length] == 1)
  {
    __int16 v13 = [v11 characterAtIndex:0];
    double v14 = [v12 fontName];
    [v12 fontSize];
    double v16 = v15;
    [v12 fontWeight];
    double v18 = v17;
    [v12 fontWidth];
    double v20 = v19;
    int v21 = UIKBGlyphForCharacter(v14, v13, v16, v18, v19);
    CGGlyph glyphs = v21;
    if (!v21) {
      goto LABEL_16;
    }
    double v47 = x;
    do
    {
      double v22 = (const __CTFont *)UIKBCreateCTFont(v14, v16, v18, v20);
      CGRect OpticalBoundsForGlyphs = CTFontGetOpticalBoundsForGlyphs(v22, &glyphs, 0, 1, 0);
      double v23 = OpticalBoundsForGlyphs.size.width;
      BOOL v24 = OpticalBoundsForGlyphs.size.width > width + -4.0;
      if (OpticalBoundsForGlyphs.size.height > height) {
        BOOL v24 = 1;
      }
      if (v24) {
        double v16 = v16 + -1.0;
      }
    }
    while (v24 && v16 > 0.0);
    [v12 minFontSize];
    if (v16 >= v25)
    {
      double XHeight = UIKBGetXHeight(v14, v16);
      if (XHeight == 0.0) {
        double XHeight = CTFontGetXHeight(v22);
      }
      double v27 = y + height * 0.5 + XHeight * 0.5;
      double v28 = [v12 textColor];
      CopyWithAlpha = (CGColor *)UIKBGetNamedColor(v28);

      [v12 textOpacity];
      if (v30 == 1.0)
      {
        CGColorRetain(CopyWithAlpha);
      }
      else
      {
        [v12 textOpacity];
        CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, v31);
      }
      CGContextSaveGState(self->_ctx);
      ctCGFloat x = self->_ctx;
      CGAffineTransformMakeScale(&v48, 1.0, -1.0);
      CGContextSetTextMatrix(ctx, &v48);
      [v12 textOffset];
      double v35 = v34;
      [v12 etchOffset];
      positions.CGFloat x = floor(v47 + (width - ceil(v23)) * 0.5 + 0.5) + v35 + v36;
      [v12 textOffset];
      double v38 = v37;
      [v12 etchOffset];
      positions.double y = -ceil(v27) - (v38 + v39);
      double v40 = [v12 etchColor];

      if (v40)
      {
        id v41 = self->_ctx;
        double v42 = [v12 etchColor];
        double v43 = (CGColor *)UIKBGetNamedColor(v42);
        CGContextSetFillColorWithColor(v41, v43);

        CTFontDrawGlyphs(v22, &glyphs, &positions, 1uLL, self->_ctx);
      }
      [v12 etchOffset];
      positions.CGFloat x = positions.x - v44;
      [v12 etchOffset];
      positions.double y = positions.y + v45;
      CGContextSetFillColorWithColor(self->_ctx, CopyWithAlpha);
      BOOL v32 = 1;
      CTFontDrawGlyphs(v22, &glyphs, &positions, 1uLL, self->_ctx);
      CGContextRestoreGState(self->_ctx);
      CGColorRelease(CopyWithAlpha);
    }
    else
    {
LABEL_16:
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)_drawKeyString:(id)a3 inRect:(CGRect)a4 withStyle:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double y = a4.origin.y;
  id v10 = a3;
  id v11 = a5;
  if (![v10 length]) {
    goto LABEL_17;
  }
  id v12 = [v11 fontName];

  if (v12)
  {
    v142.origin.double x = x;
    v142.origin.double y = y;
    v142.size.double width = width;
    v142.size.double height = height;
    if (!CGRectIsEmpty(v142))
    {
      if (self->_colorDetectMode)
      {
        double v14 = [v11 textColor];
        [(UIKBRenderer *)self detectColorsForNamedColor:v14];

        double v15 = [v11 etchColor];
        [(UIKBRenderer *)self detectColorsForNamedColor:v15];

        if (self->_contentColorFormat)
        {
          double v16 = [v11 fontName];
          int v17 = [v16 isEqualToString:@"AppleColorEmoji"];

          if (v17)
          {
            self->_contentColorFormat = 0;
            self->_int colorCount = 2;
            singleColor = self->_singleColor;
            self->_singleColor = 0;
          }
        }
        goto LABEL_17;
      }
      if ([v11 anchorCorner] != 1 && objc_msgSend(v11, "anchorCorner") != 4)
      {
        if ([v11 anchorCorner] != 2 && objc_msgSend(v11, "anchorCorner") != 8)
        {
LABEL_15:
          if (![v11 selector]
            && -[UIKBRenderer _drawSingleSymbol:inRect:withStyle:](self, "_drawSingleSymbol:inRect:withStyle:", v10, v11, x, y, width, height))
          {
LABEL_17:
            BOOL v13 = 1;
            goto LABEL_18;
          }
          v141[0] = 0.0;
          double v132 = height;
          double v133 = width;
          v123 = self;
          if ([v10 rangeOfString:@"\n" options:2] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v11 fontSize];
            double v23 = v22;
            BOOL v24 = 0;
            double v140 = v22;
            int v25 = 1;
            double v26 = v22;
          }
          else
          {
            BOOL v24 = [v10 componentsSeparatedByString:@"\n"];
            unint64_t v27 = [v24 count];
            if (v27 >= 3) {
              int v25 = 3;
            }
            else {
              int v25 = v27;
            }
            [v11 fontSize];
            double v26 = v28;
            if (!v25)
            {
              id v41 = 0;
              char v44 = 1;
              double v136 = INFINITY;
              double v30 = v28;
LABEL_48:
              double v140 = v30;
              v141[0] = v26;
              [v11 minFontSize];
              BOOL v13 = v30 >= v45;
              if (v30 < v45)
              {
                if (v41) {
                  CFRelease(v41);
                }
                goto LABEL_57;
              }
              double v46 = [v11 textColor];
              CopyWithAlpha = (CGColor *)UIKBGetNamedColor(v46);

              [v11 textOpacity];
              BOOL v115 = v13;
              if (v48 == 1.0)
              {
                CGColorRetain(CopyWithAlpha);
              }
              else
              {
                [v11 textOpacity];
                CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, v49);
              }
              if (v44)
              {
LABEL_56:
                CGColorRelease(CopyWithAlpha);
                BOOL v13 = v115;
LABEL_57:

                goto LABEL_18;
              }
              uint64_t v50 = 0;
              double v119 = v26 + v26;
              double v120 = y + (1.5 - (double)v25) * v26;
              double v127 = height / (double)v25;
              double v129 = (double)v25;
              double v125 = width / (double)v25;
              double v121 = floor(x + 0.5);
              double v116 = width * 0.5;
              uint64_t v51 = v25;
              double v117 = height * 0.5;
              double v118 = x + (width - v136 * (double)(v25 - 1)) * 0.5;
              int v135 = v25;
              v131 = CopyWithAlpha;
              while (1)
              {
                if ([v11 isVertical]) {
                  int v52 = v51 - 1;
                }
                else {
                  int v52 = v50;
                }
                int v53 = [v11 isVertical];
                double v54 = (double)v52;
                if (v53) {
                  double v55 = x + width * (double)v52 / v129;
                }
                else {
                  double v55 = x;
                }
                if (v53) {
                  double v56 = y;
                }
                else {
                  double v56 = y + height * (double)v52 / v129;
                }
                if (v53) {
                  double v57 = v125;
                }
                else {
                  double v57 = width;
                }
                if (v53) {
                  CGFloat v58 = height;
                }
                else {
                  CGFloat v58 = v127;
                }
                if (v25 != 1)
                {
                  double v59 = v10;
                  if (v24)
                  {
                    double v59 = [v24 objectAtIndex:v50];
                    v122 = v59;
                  }
                  id v60 = [v11 fontName];
                  [v11 fontWeight];
                  double v62 = v61;
                  [v11 fontWidth];
                  double v64 = v63;
                  [v11 kerning];
                  id v41 = UIKBCreateFitCTLine(v59, v60, &v140, v141, [v11 selector], objc_msgSend(v11, "ignoreTextMarginOnKey"), objc_msgSend(v11, "isVertical"), v55, v56, v57, v58, v62, v64, v65);

                  if (v24) {
                  double height = v132;
                  }
                }
                double width = v133;
                double TypographicBounds = CTLineGetTypographicBounds(v41, 0, 0, 0);
                if ([v11 isVertical])
                {
                  if ([v11 anchorCorner] || objc_msgSend(v11, "alignment") != 1)
                  {
                    if (os_variant_has_internal_diagnostics())
                    {
                      CGRect v114 = __UIFaultDebugAssertLog();
                      if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_fault_impl(&dword_1853B0000, v114, OS_LOG_TYPE_FAULT, "only alignment center is supported in vertical orientation", buf, 2u);
                      }

                      double height = v132;
                      double width = v133;
                    }
                    else
                    {
                      CGRect v113 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_drawKeyString_inRect_withStyle____s_category)+ 8);
                      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1853B0000, v113, OS_LOG_TYPE_ERROR, "only alignment center is supported in vertical orientation", buf, 2u);
                      }
                    }
                  }
                  double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v41, 0.5, height);
                  [v11 textOffset];
                  double v69 = PenOffsetForFlush + v68;
                  [v11 etchOffset];
                  double v71 = y + v69 + v70;
                  [v11 textOffset];
                  double v73 = v72;
                  [v11 etchOffset];
                  double v75 = ceil(v118 + v136 * v54) + v73 + v74;
                  goto LABEL_105;
                }
                double v71 = ceil(v120 + v119 * v54);
                if ([v11 anchorCorner])
                {
                  if ([v11 anchorCorner] == 1)
                  {
                    [v11 textOffset];
                    double v77 = v76;
                    [v11 etchOffset];
                    double v79 = v77 + v78;
                    goto LABEL_87;
                  }
                  if ([v11 anchorCorner] == 4)
                  {
                    [v11 textOffset];
                    double v87 = v86;
                    [v11 etchOffset];
                    double v89 = v87 + v88;
                    goto LABEL_103;
                  }
                  if ([v11 anchorCorner] == 2)
                  {
                    [v11 textOffset];
                    double v91 = v133 - v90 - TypographicBounds;
                    [v11 etchOffset];
                    double v79 = v92 + v91;
LABEL_87:
                    double v75 = v121 + v79;
                    double v80 = v141[0];
                    [v11 textOffset];
                    double v82 = v80 + v81;
                    [v11 etchOffset];
                    double v84 = v82 + v83;
                  }
                  else
                  {
                    if ([v11 anchorCorner] != 8)
                    {
                      double v75 = v121;
                      goto LABEL_105;
                    }
                    [v11 textOffset];
                    double v100 = v133 - v99 - TypographicBounds;
                    [v11 etchOffset];
                    double v89 = v101 + v100;
LABEL_103:
                    double v75 = v121 + v89;
                    double v102 = height - v141[0];
                    [v11 textOffset];
                    double v104 = v102 - v103;
                    [v11 etchOffset];
                    double v84 = v104 - v105;
                  }
                  double v71 = v71 + v84;
                  goto LABEL_105;
                }
                if ([v11 alignment] == 1) {
                  break;
                }
                double v85 = v116;
                if (![v11 alignment]) {
                  goto LABEL_99;
                }
                double v75 = v121;
                if ([v11 alignment] == 2)
                {
                  double v85 = v116 - TypographicBounds;
LABEL_99:
                  [v11 textOffset];
                  double v94 = v85 + v93;
                  [v11 etchOffset];
                  double v75 = v121 + v94 + v95;
                }
                [v11 textOffset];
                double v97 = v117 + v96;
                [v11 etchOffset];
                double v71 = v71 + v97 + v98;
                double height = v132;
LABEL_105:
                double v106 = [v11 etchColor];

                if (v106)
                {
                  ctdouble x = v123->_ctx;
                  double v108 = [v11 etchColor];
                  id v109 = (CGColor *)UIKBGetNamedColor(v108);
                  UIKBDrawCTLineAtPoint(ctx, v41, v109, [v11 isVertical], v75, v71);
                }
                [v11 etchOffset];
                double v111 = v75 - v110;
                [v11 etchOffset];
                CopyWithAlpha = v131;
                UIKBDrawCTLineAtPoint(v123->_ctx, v41, v131, [v11 isVertical], v111, v71 - v112);
                if (v41) {
                  CFRelease(v41);
                }
                ++v50;
                --v51;
                int v25 = v135;
                if (!v51) {
                  goto LABEL_56;
                }
              }
              if (v133 - TypographicBounds >= 0.0) {
                double v85 = CTLineGetPenOffsetForFlush(v41, 0.5, v133);
              }
              else {
                double v85 = (v133 - TypographicBounds) * 0.5;
              }
              goto LABEL_99;
            }
            double v23 = v28;
          }
          uint64_t v29 = 0;
          double v126 = height / (double)v25;
          double v128 = (double)v25;
          double v136 = INFINITY;
          double v30 = v23;
          double v124 = width / (double)v25;
          double v130 = v23;
          do
          {
            double v134 = v26;
            int v31 = [v11 isVertical];
            if (v31) {
              double v32 = x + width * (double)(int)v29 / v128;
            }
            else {
              double v32 = x;
            }
            if (v31) {
              double v33 = y;
            }
            else {
              double v33 = y + height * (double)(int)v29 / v128;
            }
            if (v31) {
              double width = v124;
            }
            else {
              double height = v126;
            }
            *(double *)buf = v23;
            double v34 = v10;
            if (v24)
            {
              id v5 = [v24 objectAtIndex:v29];
              double v34 = v5;
            }
            double v35 = [v11 fontName];
            [v11 fontWeight];
            double v37 = v36;
            [v11 fontWidth];
            double v39 = v38;
            [v11 kerning];
            id v41 = UIKBCreateFitCTLine(v34, v35, (double *)buf, v141, [v11 selector], objc_msgSend(v11, "ignoreTextMarginOnKey"), objc_msgSend(v11, "isVertical"), v32, v33, width, height, v37, v39, v40);

            if (v24) {
            double v26 = v134;
            }
            if (*(double *)buf <= v30)
            {
              double v26 = v141[0];
              double v30 = *(double *)buf;
            }
            double v42 = CTLineGetTypographicBounds(v41, 0, 0, 0);
            double v43 = v136;
            if (v42 < v136) {
              double v43 = v42;
            }
            double v136 = v43;
            double height = v132;
            double width = v133;
            if (v25 != 1)
            {
              CFRelease(v41);
              id v41 = 0;
            }
            double v23 = v130;
            ++v29;
          }
          while (v25 != v29);
          char v44 = 0;
          goto LABEL_48;
        }
        [v11 textOffset];
        double x = x + v19;
      }
      [v11 textOffset];
      double width = width - v20;
      goto LABEL_15;
    }
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

- (unint64_t)renderKeyStringContents:(id)a3 withTraits:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v78 = 0;
  double v79 = &v78;
  uint64_t v80 = 0x2020000000;
  unint64_t v81 = a5;
  id v10 = [v8 displayString];
  char v11 = [(UIKBRenderer *)self renderFlags];
  if (!v9 || (v11 & 0x34) == 0 || !v10) {
    goto LABEL_42;
  }
  if ([v9 renderSecondarySymbolsSeparately]) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 52;
  }
  if ((a5 & 2) == 0)
  {
    BOOL v13 = [v8 secondaryDisplayStrings];
    if ([v13 count])
    {
      double v14 = [v9 secondarySymbolStyles];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        double v16 = [v8 displayString];
        uint64_t v17 = [v16 length];
        BOOL v18 = v17 != 0;

        if (v17)
        {
          double v19 = [v8 displayStringImage];
          if ([v19 length])
          {
          }
          else
          {
            int64_t v46 = [(UIKBRenderer *)self renderFlags] & v12;

            if (v46)
            {
              double v47 = [v8 displayString];
              double v48 = [v9 geometry];
              [v48 symbolFrame];
              double v50 = v49;
              double v52 = v51;
              double v54 = v53;
              double v56 = v55;
              double v57 = [v9 symbolStyle];
              -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v47, v57, v50, v52, v54, v56);

              v79[3] |= 1uLL;
            }
          }
        }
        CGFloat v58 = [v8 secondaryDisplayStrings];
        unint64_t v59 = [v58 count];

        id v60 = [v9 secondarySymbolStyles];
        unint64_t v61 = [v60 count];

        if (![v9 renderSecondarySymbolsSeparately])
        {
          double v63 = [v8 secondaryDisplayStrings];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __58__UIKBRenderer_renderKeyStringContents_withTraits_status___block_invoke;
          v72[3] = &unk_1E52FA398;
          v72[4] = self;
          uint64_t v75 = 52;
          unint64_t v76 = v61;
          BOOL v77 = v18;
          id v73 = v9;
          double v74 = &v78;
          [v63 enumerateObjectsUsingBlock:v72];

          goto LABEL_42;
        }
        if (([(UIKBRenderer *)self renderFlags] & 0x20) != 0)
        {
          unint64_t v62 = 1;
        }
        else
        {
          if (([(UIKBRenderer *)self renderFlags] & 0x10) == 0) {
            goto LABEL_42;
          }
          unint64_t v62 = 0;
        }
        if (v62 >= v59)
        {
          double v65 = 0;
        }
        else
        {
          double v64 = [v8 secondaryDisplayStrings];
          double v65 = [v64 objectAtIndex:v62];
        }
        if (v62 >= v61
          || ([v9 secondarySymbolStyles],
              char v66 = objc_claimAutoreleasedReturnValue(),
              [v66 objectAtIndex:v62],
              double v67 = objc_claimAutoreleasedReturnValue(),
              v66,
              !v67))
        {
          double v68 = [v9 secondarySymbolStyles];
          double v67 = [v68 lastObject];
        }
        if ([v65 length])
        {
          if (!v17) {
            objc_msgSend(v67, "setTextOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
          }
          double v69 = [v9 geometry];
          [v69 symbolFrame];
          -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v65, v67);

          v79[3] = 3;
        }

        goto LABEL_42;
      }
    }
    else
    {
    }
  }
  if ((a5 & 1) == 0)
  {
    double v20 = [v9 geometry];
    [v20 symbolFrame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    uint64_t v29 = [v9 symbolStyle];
    BOOL v30 = -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v10, v29, v22, v24, v26, v28);

    if ([v8 stringKeycapOverImage])
    {
      BOOL v31 = 0;
    }
    else
    {
      double v32 = [v8 displayStringImage];
      BOOL v31 = v32 != 0;
    }
    if (v30 || v31)
    {
      if (!v30) {
        goto LABEL_42;
      }
    }
    else
    {
      double v33 = [v8 fallbackContents];
      double v34 = [v33 displayString];
      double v35 = [v9 geometry];
      [v35 symbolFrame];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      char v44 = [v9 fallbackSymbolStyle];
      BOOL v45 = -[UIKBRenderer _drawKeyString:inRect:withStyle:](self, "_drawKeyString:inRect:withStyle:", v34, v44, v37, v39, v41, v43);

      if (!v45) {
        goto LABEL_42;
      }
    }
    v79[3] = 3;
  }
LABEL_42:
  unint64_t v70 = v79[3];

  _Block_object_dispose(&v78, 8);
  return v70;
}

void __58__UIKBRenderer_renderKeyStringContents_withTraits_status___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v10 = a2;
  if ([v10 length] && (*(void *)(a1 + 56) & objc_msgSend(*(id *)(a1 + 32), "renderFlags")) != 0)
  {
    if (*(void *)(a1 + 64) <= a3
      || ([*(id *)(a1 + 40) secondarySymbolStyles],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [v5 objectAtIndex:a3],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v5,
          !v6))
    {
      id v7 = [*(id *)(a1 + 40) secondarySymbolStyles];
      id v6 = [v7 lastObject];
    }
    if (!*(unsigned char *)(a1 + 72)) {
      objc_msgSend(v6, "setTextOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) geometry];
    [v9 symbolFrame];
    objc_msgSend(v8, "_drawKeyString:inRect:withStyle:", v10, v6);

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 2uLL;
  }
}

- (CGPath)_thinShiftGlyphPath
{
  if (qword_1EB261958 != -1) {
    dispatch_once(&qword_1EB261958, &__block_literal_global_41_2);
  }
  return (CGPath *)qword_1EB261950;
}

CGMutablePathRef __35__UIKBRenderer__thinShiftGlyphPath__block_invoke()
{
  CGMutablePathRef result = createMutablePathWithPoints(dbl_186B99CE0, 10, 1);
  qword_1EB261950 = (uint64_t)result;
  return result;
}

- (CGPath)_thickShiftGlyphPath
{
  if (qword_1EB261968 != -1) {
    dispatch_once(&qword_1EB261968, &__block_literal_global_43_3);
  }
  return (CGPath *)qword_1EB261960;
}

CGMutablePathRef __36__UIKBRenderer__thickShiftGlyphPath__block_invoke()
{
  CGMutablePathRef result = createMutablePathWithPoints(dbl_186B99D80, 10, 1);
  qword_1EB261960 = (uint64_t)result;
  return result;
}

- (CGPath)_deleteGlyphPaths
{
  if (qword_1EB261978 != -1) {
    dispatch_once(&qword_1EB261978, &__block_literal_global_46_2);
  }
  return (CGPath *)qword_1EB261970;
}

CGMutablePathRef __33__UIKBRenderer__deleteGlyphPaths__block_invoke()
{
  CGMutablePathRef result = createMutablePathWithPoints(dbl_186B99E20, 13, 1);
  qword_1EB261970 = (uint64_t)result;
  return result;
}

- (void)drawPath:(CGPath *)a3 weight:(double)a4 transform:(CGAffineTransform *)a5 color:(CGColor *)a6 fill:(BOOL)a7
{
  if (a3 && a6)
  {
    BOOL v8 = a7;
    MutableCopyByTransformingPath = CGPathCreateMutableCopyByTransformingPath(a3, a5);
    CGContextSaveGState(self->_ctx);
    CGContextSetLineWidth(self->_ctx, a4);
    CGContextSetLineJoin(self->_ctx, kCGLineJoinMiter);
    CGContextSetLineCap(self->_ctx, kCGLineCapSquare);
    if (v8)
    {
      CGContextAddPath(self->_ctx, MutableCopyByTransformingPath);
      CGContextSetFillColorWithColor(self->_ctx, a6);
      CGContextFillPath(self->_ctx);
    }
    CGContextAddPath(self->_ctx, MutableCopyByTransformingPath);
    CGContextSetStrokeColorWithColor(self->_ctx, a6);
    CGContextStrokePath(self->_ctx);
    CGPathRelease(MutableCopyByTransformingPath);
    ctdouble x = self->_ctx;
    CGContextRestoreGState(ctx);
  }
}

- (void)drawShiftPath:(BOOL)a3 weight:(double)a4 transform:(CGAffineTransform *)a5 color:(CGColor *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if (a3) {
      double v10 = 0.0;
    }
    else {
      double v10 = 0.12;
    }
    MutablePathWithPoints = createMutablePathWithPoints(dbl_186B99EF0, 7, 0);
    MutableCopyByTransformingPath = CGPathCreateMutableCopyByTransformingPath(MutablePathWithPoints, a5);
    long long v15 = xmmword_186B99CC0;
    uint64_t v16 = 0x3FE0000000000000;
    double v17 = 6.0 - v10;
    uint64_t v18 = 0x4023000000000000;
    double v19 = 15.0 - v10;
    uint64_t v20 = 0x4032800000000000;
    double v21 = 6.0 - v10;
    long long v22 = xmmword_186B99CD0;
    BOOL v13 = createMutablePathWithPoints((CGFloat *)&v15, 5, 0);
    double v14 = CGPathCreateMutableCopyByTransformingPath(v13, a5);
    CGContextSaveGState(self->_ctx);
    CGContextSetLineJoin(self->_ctx, kCGLineJoinMiter);
    CGContextSetLineCap(self->_ctx, kCGLineCapButt);
    CGContextSetLineWidth(self->_ctx, a4);
    CGContextAddPath(self->_ctx, MutableCopyByTransformingPath);
    CGContextSetStrokeColorWithColor(self->_ctx, a6);
    CGContextStrokePath(self->_ctx);
    CGContextSetLineWidth(self->_ctx, a4 - v10);
    CGContextAddPath(self->_ctx, v14);
    CGContextSetStrokeColorWithColor(self->_ctx, a6);
    CGContextStrokePath(self->_ctx);
    CGContextRestoreGState(self->_ctx);
    CGPathRelease(MutableCopyByTransformingPath);
    CGPathRelease(v14);
    CGPathRelease(MutablePathWithPoints);
    CGPathRelease(v13);
  }
}

- (BOOL)renderKeyPathContents:(id)a3 withTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 displayPathType];
  char v9 = [(UIKBRenderer *)self renderFlags];
  BOOL v10 = 0;
  if (v7 && (v9 & 4) != 0 && v8)
  {
    if (self->_colorDetectMode)
    {
      char v11 = [v7 symbolStyle];
      uint64_t v12 = [v11 textColor];
      [(UIKBRenderer *)self detectColorsForNamedColor:v12];

      BOOL v10 = 1;
      goto LABEL_36;
    }
    BOOL v13 = [v7 symbolStyle];
    double v14 = [v13 textColor];
    uint64_t v15 = [v14 isEqualToString:@"UIKBColorWhite"];

    switch(v8)
    {
      case 1:
        if (v15)
        {
          uint64_t v16 = [(UIKBRenderer *)self _thickShiftGlyphPath];
          double v17 = 0.0;
        }
        else
        {
          uint64_t v16 = [(UIKBRenderer *)self _thinShiftGlyphPath];
          double v17 = 0.12;
        }
        BoundingBodouble x = CGPathGetBoundingBox(v16);
        double x = BoundingBox.origin.x;
        double y = BoundingBox.origin.y;
        double width = BoundingBox.size.width;
        double height = v17 + BoundingBox.size.height;
        break;
      case 4:
        uint64_t v20 = +[UIBezierPath bezierPath];
        double height = 10.0;
        objc_msgSend(v20, "moveToPoint:", 1.0, 10.0);
        double y = 0.0;
        objc_msgSend(v20, "addLineToPoint:", 1.0, 0.0);
        [v20 closePath];
        id v21 = v20;
        uint64_t v16 = (CGPath *)[v21 CGPath];

        double width = 2.0;
        double x = 0.0;
        break;
      case 3:
        long long v22 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 15.0, 15.0);
        objc_msgSend(v22, "moveToPoint:", 4.25, 10.75);
        objc_msgSend(v22, "addLineToPoint:", 10.75, 4.25);
        objc_msgSend(v22, "moveToPoint:", 4.25, 4.25);
        objc_msgSend(v22, "addLineToPoint:", 10.75, 10.75);
        [v22 closePath];
        id v23 = v22;
        uint64_t v16 = (CGPath *)[v23 CGPath];
        CGRect v74 = CGPathGetBoundingBox(v16);
        double x = v74.origin.x;
        double y = v74.origin.y;
        double width = v74.size.width;
        double height = v74.size.height;

        break;
      case 2:
        uint64_t v16 = [(UIKBRenderer *)self _deleteGlyphPaths];
        CGRect v72 = CGPathGetBoundingBox(v16);
        double x = v72.origin.x;
        double y = v72.origin.y;
        double width = v72.size.width;
        double height = v72.size.height;
        break;
      default:
        uint64_t v16 = 0;
        double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double x = *MEMORY[0x1E4F1DB28];
        double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        break;
    }
    double v24 = [v7 geometry];
    [v24 symbolFrame];
    double v26 = v25;

    if (width <= v26)
    {
      double v30 = floor(height);
      BOOL v31 = [v7 symbolStyle];
      [v31 fontSize];
      double v33 = v32;

      double v29 = 1.0;
      if (v30 >= v33) {
        goto LABEL_23;
      }
      double v27 = [v7 symbolStyle];
      [v27 fontSize];
      double v29 = v34 / v30;
    }
    else
    {
      double v27 = [v7 geometry];
      [v27 symbolFrame];
      double v29 = v28 / width;
    }

LABEL_23:
    memset(&v71, 0, sizeof(v71));
    CGAffineTransformMakeScale(&v71, v29, v29);
    double v35 = [v7 symbolStyle];
    [v35 textOffset];
    double v37 = v36;
    double v66 = v38;

    double v39 = [v7 geometry];
    [v39 symbolFrame];
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    [(UIKBRenderer *)self scale];
    double v49 = UIRectCenteredIntegralRectScale(x, y, width * v29, height * v29, v41, v43, v45, v47, v48);
    double v51 = v50;

    CGAffineTransform v69 = v71;
    CGAffineTransformTranslate(&v70, &v69, (v37 + v49) / v29, (v66 + v51 + -1.0) / v29);
    CGAffineTransform v71 = v70;
    double v52 = [v7 symbolStyle];
    double v53 = [v52 textColor];
    CopyWithAlpha = (CGColor *)UIKBGetNamedColor(v53);

    double v55 = [v7 symbolStyle];
    [v55 textOpacity];
    double v57 = v56;

    if (v57 == 1.0)
    {
      CGColorRetain(CopyWithAlpha);
    }
    else
    {
      CGFloat v58 = [v7 symbolStyle];
      [v58 textOpacity];
      CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, v59);
    }
    if ([v6 fillPath])
    {
      id v60 = [v7 symbolStyle];
      [v60 pathWeight];
      CGAffineTransform v70 = v71;
      unint64_t v61 = self;
      unint64_t v62 = v16;
      double v63 = CopyWithAlpha;
      uint64_t v64 = 1;
    }
    else
    {
      if ([v6 fillPath])
      {
        BOOL v10 = 0;
LABEL_35:
        CGColorRelease(CopyWithAlpha);
        goto LABEL_36;
      }
      id v60 = [v7 symbolStyle];
      [v60 pathWeight];
      if (v8 == 1)
      {
        CGAffineTransform v70 = v71;
        -[UIKBRenderer drawShiftPath:weight:transform:color:](self, "drawShiftPath:weight:transform:color:", v15, &v70, CopyWithAlpha);
LABEL_34:

        BOOL v10 = 1;
        goto LABEL_35;
      }
      CGAffineTransform v70 = v71;
      unint64_t v61 = self;
      unint64_t v62 = v16;
      double v63 = CopyWithAlpha;
      uint64_t v64 = 0;
    }
    -[UIKBRenderer drawPath:weight:transform:color:fill:](v61, "drawPath:weight:transform:color:fill:", v62, &v70, v63, v64);
    goto LABEL_34;
  }
LABEL_36:

  return v10;
}

- (void)addRoundRect:(CGRect)a3 radius:(double)a4 corners:(unint64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4 <= 0.0 || a5 == 0)
  {
    char v11 = [(UIKBRenderer *)self context];
    CGFloat v12 = x;
    CGFloat v13 = y;
    CGFloat v14 = width;
    CGFloat v15 = height;
    CGContextAddRect(v11, *(CGRect *)&v12);
  }
  else
  {
    uint64_t v16 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a4);
    double v17 = [(UIKBRenderer *)self context];
    id v18 = v16;
    CGContextAddPath(v17, (CGPathRef)[v18 CGPath]);
  }
}

- (void)addPathForTraits:(id)a3 displayRect:(CGRect *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!self->_colorDetectMode)
  {
    uint64_t v8 = [v6 geometry];
    uint64_t v9 = [v8 flickDirection];

    if (v9 == -3)
    {
      BOOL v10 = [v7 geometry];
      uint64_t v11 = [v10 splitLeftRect];
      if (v11)
      {
        CGFloat v12 = (void *)v11;
        CGFloat v13 = [v7 geometry];
        CGFloat v14 = [v13 splitRightRect];

        if (v14)
        {
          CGFloat v15 = [v7 geometry];
          [(UIKBRenderer *)self addPathForSplitGeometry:v15];
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
      }
      double v17 = [v7 geometry];
      if ([v17 detachedVariants])
      {
        id v18 = [v7 variantGeometries];

        if (v18)
        {
          double v19 = [v7 geometry];
          CGFloat v15 = (void *)[v19 copy];

          [v15 setPopupBias:0];
          [(UIKBRenderer *)self addPathForRenderGeometry:v15];
          double x = *MEMORY[0x1E4F1DB20];
          double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          double v24 = objc_msgSend(v7, "variantGeometries", 0);
          uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v59 != v27) {
                  objc_enumerationMutation(v24);
                }
                double v29 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                v64.origin.double x = x;
                v64.origin.double y = y;
                v64.size.double width = width;
                v64.size.double height = height;
                BOOL IsNull = CGRectIsNull(v64);
                [v29 frame];
                double v35 = v31;
                double v36 = v32;
                double v37 = v33;
                double v38 = v34;
                if (!IsNull)
                {
                  v65.origin.double x = x;
                  v65.origin.double y = y;
                  v65.size.double width = width;
                  v65.size.double height = height;
                  *(CGRect *)&double v31 = CGRectUnion(v65, *(CGRect *)&v35);
                }
                double x = v31;
                double y = v32;
                double width = v33;
                double height = v34;
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
            }
            while (v26);
          }

          double v39 = [v7 geometry];
          if ([v39 roundRectCorners])
          {
          }
          else
          {
            double v50 = [v7 geometry];
            [v50 roundRectRadius];
            double v52 = v51;

            if (v52 != 0.0)
            {
LABEL_30:
              objc_msgSend(v15, "setFrame:", x, y, width, height);
              objc_msgSend(v15, "setPaddedFrame:", x, y, width, height);
              objc_msgSend(v15, "setDisplayFrame:", x, y, width, height);
              [v15 setRoundRectCorners:-1];
              double v57 = [v7 geometry];
              [v57 roundRectRadius];
              objc_msgSend(v15, "setRoundRectRadius:");

              goto LABEL_31;
            }
          }
          [v15 roundRectRadius];
          CGFloat v54 = -v53;
          [v15 roundRectRadius];
          CGFloat v56 = -v55;
          v66.origin.double x = x;
          v66.origin.double y = y;
          v66.size.double width = width;
          v66.size.double height = height;
          CGRect v67 = CGRectInset(v66, v54, v56);
          double x = v67.origin.x;
          double y = v67.origin.y;
          double width = v67.size.width;
          double height = v67.size.height;
          goto LABEL_30;
        }
      }
      else
      {
      }
      CGFloat v15 = [v7 geometry];
LABEL_31:
      [(UIKBRenderer *)self addPathForRenderGeometry:v15];
      goto LABEL_32;
    }
    uint64_t v16 = [v7 variantGeometries];

    if (v16)
    {
      CGFloat v15 = [v7 variantGeometries];
      [(UIKBRenderer *)self addPathForFlickPopupGeometries:v15];
      goto LABEL_32;
    }
    double v40 = [v7 variantTraits];
    double v41 = [v40 geometry];

    double v42 = [v7 geometry];
    if (v41)
    {
      [(UIKBRenderer *)self addPathForRenderGeometry:v42];
    }
    else
    {
      [(UIKBRenderer *)self addPathForFlickGeometry:v42];

      if (a4)
      {
        double v43 = [v7 geometry];
        [v43 popupSource];
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        CGFloat v48 = *MEMORY[0x1E4F1DB30];
        CGFloat v49 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

        v68.origin.double x = v45;
        v68.origin.double y = v47;
        v68.size.double width = v48;
        v68.size.double height = v49;
        *a4 = CGRectUnion(*a4, v68);
      }
    }
  }
LABEL_33:
}

- (void)addPathForRenderGeometry:(id)a3
{
  id v4 = [(UIKBRenderer *)self pathForRenderGeometry:a3];
  if (v4) {
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)[v4 CGPath]);
  }
}

- (void)addPathForFlickGeometry:(id)a3
{
  id v4 = [(UIKBRenderer *)self pathForFlickGeometry:a3];
  if (v4) {
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)[v4 CGPath]);
  }
}

- (void)addPathForFlickPopupGeometries:(id)a3
{
  id v4 = [(UIKBRenderer *)self pathForFlickPopupGeometries:a3];
  if (v4) {
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)[v4 CGPath]);
  }
}

- (void)addPathForSplitGeometry:(id)a3
{
  id v4 = [(UIKBRenderer *)self pathForSplitGeometry:a3];
  if (v4) {
    CGContextAddPath(-[UIKBRenderer context](self, "context"), (CGPathRef)[v4 CGPath]);
  }
}

- (id)pathForConcaveCornerWithGeometry:(id)a3
{
  id v3 = a3;
  id v4 = +[UIBezierPath bezierPath];
  [v3 paddedFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v3 roundRectRadius];
  double v14 = v13;
  [v3 roundRectRadius];
  double v16 = v15;
  uint64_t v17 = [v3 concaveCorner];
  [v3 concaveCornerOffset];
  double v19 = v18;
  double v21 = v20;

  id v22 = 0;
  switch(v17)
  {
    case 1:
      v90.origin.double x = v6;
      v90.origin.double y = v8;
      v90.size.double width = v10;
      v90.size.double height = v12;
      double MidX = CGRectGetMidX(v90);
      v91.origin.double x = v6;
      v91.origin.double y = v8;
      v91.size.double width = v10;
      v91.size.double height = v12;
      double MaxY = CGRectGetMaxY(v91);
      v92.origin.double x = v6;
      v92.origin.double y = v8;
      v92.size.double width = v10;
      v92.size.double height = v12;
      double MinX = CGRectGetMinX(v92);
      v93.origin.double x = v6;
      v93.origin.double y = v8;
      v93.size.double width = v10;
      v93.size.double height = v12;
      double v69 = CGRectGetMaxY(v93);
      v94.origin.double x = v6;
      v94.origin.double y = v8;
      v94.size.double width = v10;
      v94.size.double height = v12;
      double v73 = CGRectGetMinX(v94);
      v95.origin.double x = v6;
      v95.origin.double y = v8;
      v95.size.double width = v10;
      v95.size.double height = v12;
      double v61 = v21 + CGRectGetMinY(v95);
      v96.origin.double x = v6;
      v96.origin.double y = v8;
      v96.size.double width = v10;
      v96.size.double height = v12;
      double v65 = v19 + CGRectGetMinX(v96);
      v97.origin.double x = v6;
      v97.origin.double y = v8;
      v97.size.double width = v10;
      v97.size.double height = v12;
      double v57 = v21 + CGRectGetMinY(v97);
      v98.origin.double x = v6;
      v98.origin.double y = v8;
      v98.size.double width = v10;
      v98.size.double height = v12;
      double v53 = v19 + CGRectGetMinX(v98);
      v99.origin.double x = v6;
      v99.origin.double y = v8;
      v99.size.double width = v10;
      v99.size.double height = v12;
      CGFloat MinY = CGRectGetMinY(v99);
      v100.origin.double x = v6;
      v100.origin.double y = v8;
      v100.size.double width = v10;
      v100.size.double height = v12;
      double MaxX = CGRectGetMaxX(v100);
      v101.origin.double x = v6;
      v101.origin.double y = v8;
      v101.size.double width = v10;
      v101.size.double height = v12;
      double v23 = CGRectGetMinY(v101);
      v102.origin.double x = v6;
      v102.origin.double y = v8;
      v102.size.double width = v10;
      v102.size.double height = v12;
      CGFloat v24 = CGRectGetMaxX(v102);
      v103.origin.double x = v6;
      v103.origin.double y = v8;
      v103.size.double width = v10;
      v103.size.double height = v12;
      CGFloat v25 = CGRectGetMaxY(v103);
      objc_msgSend(v4, "moveToPoint:", MidX, MaxY);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, MinX, v69, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v73, v61, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 1, v65, v57, v14, v16);
      uint64_t v26 = v4;
      double v27 = v53;
      double v28 = MinY;
      double v29 = v14;
      double v30 = v16;
      uint64_t v31 = 0;
      uint64_t v32 = 1;
      goto LABEL_4;
    case 2:
      v104.origin.double x = v6;
      v104.origin.double y = v8;
      v104.size.double width = v10;
      v104.size.double height = v12;
      double v86 = CGRectGetMidX(v104);
      v105.origin.double x = v6;
      v105.origin.double y = v8;
      v105.size.double width = v10;
      v105.size.double height = v12;
      double v82 = CGRectGetMaxY(v105);
      v106.origin.double x = v6;
      v106.origin.double y = v8;
      v106.size.double width = v10;
      v106.size.double height = v12;
      double v78 = CGRectGetMinX(v106);
      v107.origin.double x = v6;
      v107.origin.double y = v8;
      v107.size.double width = v10;
      v107.size.double height = v12;
      double v70 = CGRectGetMaxY(v107);
      v108.origin.double x = v6;
      v108.origin.double y = v8;
      v108.size.double width = v10;
      v108.size.double height = v12;
      double v74 = CGRectGetMinX(v108);
      v109.origin.double x = v6;
      v109.origin.double y = v8;
      v109.size.double width = v10;
      v109.size.double height = v12;
      double v62 = CGRectGetMinY(v109);
      v110.origin.double x = v6;
      v110.origin.double y = v8;
      v110.size.double width = v10;
      v110.size.double height = v12;
      CGFloat v66 = CGRectGetMaxX(v110) - v19;
      v111.origin.double x = v6;
      v111.origin.double y = v8;
      v111.size.double width = v10;
      v111.size.double height = v12;
      double v58 = CGRectGetMinY(v111);
      v112.origin.double x = v6;
      v112.origin.double y = v8;
      v112.size.double width = v10;
      v112.size.double height = v12;
      CGFloat v54 = CGRectGetMaxX(v112) - v19;
      v113.origin.double x = v6;
      v113.origin.double y = v8;
      v113.size.double width = v10;
      v113.size.double height = v12;
      double v47 = v21 + CGRectGetMinY(v113);
      v114.origin.double x = v6;
      v114.origin.double y = v8;
      v114.size.double width = v10;
      v114.size.double height = v12;
      double MaxX = CGRectGetMaxX(v114);
      v115.origin.double x = v6;
      v115.origin.double y = v8;
      v115.size.double width = v10;
      v115.size.double height = v12;
      double v23 = v21 + CGRectGetMinY(v115);
      v116.origin.double x = v6;
      v116.origin.double y = v8;
      v116.size.double width = v10;
      v116.size.double height = v12;
      CGFloat v24 = CGRectGetMaxX(v116);
      v117.origin.double x = v6;
      v117.origin.double y = v8;
      v117.size.double width = v10;
      v117.size.double height = v12;
      CGFloat v25 = CGRectGetMaxY(v117);
      objc_msgSend(v4, "moveToPoint:", v86, v82);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v78, v70, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v74, v62, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v66, v58, v14, v16);
      uint64_t v26 = v4;
      double v27 = v54;
      double v28 = v47;
      double v29 = v14;
      double v30 = v16;
      uint64_t v32 = 4;
      uint64_t v31 = 1;
LABEL_4:
      objc_msgSend(v26, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", v32, v31, v27, v28, v29, v30);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, MaxX, v23, v14, v16);
      double v33 = v4;
      double v34 = v24;
      double v35 = v25;
      double v36 = v14;
      double v37 = v16;
      uint64_t v38 = 8;
      goto LABEL_6;
    case 4:
      v118.origin.double x = v6;
      v118.origin.double y = v8;
      v118.size.double width = v10;
      v118.size.double height = v12;
      double v87 = CGRectGetMidX(v118);
      v119.origin.double x = v6;
      v119.origin.double y = v8;
      v119.size.double width = v10;
      v119.size.double height = v12;
      double v83 = CGRectGetMinY(v119);
      v120.origin.double x = v6;
      v120.origin.double y = v8;
      v120.size.double width = v10;
      v120.size.double height = v12;
      double v79 = CGRectGetMaxX(v120);
      v121.origin.double x = v6;
      v121.origin.double y = v8;
      v121.size.double width = v10;
      v121.size.double height = v12;
      double v71 = CGRectGetMinY(v121);
      v122.origin.double x = v6;
      v122.origin.double y = v8;
      v122.size.double width = v10;
      v122.size.double height = v12;
      double v75 = CGRectGetMaxX(v122);
      v123.origin.double x = v6;
      v123.origin.double y = v8;
      v123.size.double width = v10;
      v123.size.double height = v12;
      double v63 = CGRectGetMaxY(v123);
      v124.origin.double x = v6;
      v124.origin.double y = v8;
      v124.size.double width = v10;
      v124.size.double height = v12;
      double v67 = v19 + CGRectGetMinX(v124);
      v125.origin.double x = v6;
      v125.origin.double y = v8;
      v125.size.double width = v10;
      v125.size.double height = v12;
      double v55 = CGRectGetMaxY(v125);
      v126.origin.double x = v6;
      v126.origin.double y = v8;
      v126.size.double width = v10;
      v126.size.double height = v12;
      double v59 = v19 + CGRectGetMinX(v126);
      v127.origin.double x = v6;
      v127.origin.double y = v8;
      v127.size.double width = v10;
      v127.size.double height = v12;
      CGFloat v48 = CGRectGetMaxY(v127) - v21;
      v128.origin.double x = v6;
      v128.origin.double y = v8;
      v128.size.double width = v10;
      v128.size.double height = v12;
      double v51 = CGRectGetMinX(v128);
      v129.origin.double x = v6;
      v129.origin.double y = v8;
      v129.size.double width = v10;
      v129.size.double height = v12;
      CGFloat v39 = CGRectGetMaxY(v129) - v21;
      v130.origin.double x = v6;
      v130.origin.double y = v8;
      v130.size.double width = v10;
      v130.size.double height = v12;
      CGFloat v40 = CGRectGetMinX(v130);
      v131.origin.double x = v6;
      v131.origin.double y = v8;
      v131.size.double width = v10;
      v131.size.double height = v12;
      CGFloat v41 = CGRectGetMinY(v131);
      objc_msgSend(v4, "moveToPoint:", v87, v83);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v79, v71, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v75, v63, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v67, v55, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, v59, v48, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v51, v39, v14, v16);
      double v33 = v4;
      double v34 = v40;
      double v35 = v41;
      double v36 = v14;
      double v37 = v16;
      uint64_t v38 = 1;
LABEL_6:
      objc_msgSend(v33, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", v38, 0, v34, v35, v36, v37);
      [v4 closePath];
      id v22 = v4;
      break;
    case 8:
      v132.origin.double x = v6;
      v132.origin.double y = v8;
      v132.size.double width = v10;
      v132.size.double height = v12;
      double v88 = CGRectGetMidX(v132);
      v133.origin.double x = v6;
      v133.origin.double y = v8;
      v133.size.double width = v10;
      v133.size.double height = v12;
      double v84 = CGRectGetMinY(v133);
      v134.origin.double x = v6;
      v134.origin.double y = v8;
      v134.size.double width = v10;
      v134.size.double height = v12;
      double v80 = CGRectGetMaxX(v134);
      v135.origin.double x = v6;
      v135.origin.double y = v8;
      v135.size.double width = v10;
      v135.size.double height = v12;
      double v72 = CGRectGetMinY(v135);
      v136.origin.double x = v6;
      v136.origin.double y = v8;
      v136.size.double width = v10;
      v136.size.double height = v12;
      double v76 = CGRectGetMaxX(v136);
      v137.origin.double x = v6;
      v137.origin.double y = v8;
      v137.size.double width = v10;
      v137.size.double height = v12;
      CGFloat v64 = CGRectGetMaxY(v137) - v21;
      v138.origin.double x = v6;
      v138.origin.double y = v8;
      v138.size.double width = v10;
      v138.size.double height = v12;
      CGFloat v68 = CGRectGetMaxX(v138) - v19;
      v139.origin.double x = v6;
      v139.origin.double y = v8;
      v139.size.double width = v10;
      v139.size.double height = v12;
      CGFloat v60 = CGRectGetMaxY(v139) - v21;
      v140.origin.double x = v6;
      v140.origin.double y = v8;
      v140.size.double width = v10;
      v140.size.double height = v12;
      CGFloat v56 = CGRectGetMaxX(v140) - v19;
      v141.origin.double x = v6;
      v141.origin.double y = v8;
      v141.size.double width = v10;
      v141.size.double height = v12;
      double v49 = CGRectGetMaxY(v141);
      v142.origin.double x = v6;
      v142.origin.double y = v8;
      v142.size.double width = v10;
      v142.size.double height = v12;
      double v52 = CGRectGetMinX(v142);
      v143.origin.double x = v6;
      v143.origin.double y = v8;
      v143.size.double width = v10;
      v143.size.double height = v12;
      double v42 = CGRectGetMaxY(v143);
      v144.origin.double x = v6;
      v144.origin.double y = v8;
      v144.size.double width = v10;
      v144.size.double height = v12;
      double v43 = CGRectGetMinX(v144);
      v145.origin.double x = v6;
      v145.origin.double y = v8;
      v145.size.double width = v10;
      v145.size.double height = v12;
      double v44 = CGRectGetMinY(v145);
      objc_msgSend(v4, "moveToPoint:", v88, v84);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v80, v72, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v76, v64, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v68, v60, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v56, v49, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v52, v42, v14, v16);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v43, v44, v14, v16);
      [v4 closePath];
      id v22 = 0;
      break;
    default:
      break;
  }

  return v22;
}

- (id)pathForRenderGeometry:(id)a3
{
  id v4 = a3;
  double v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 4) {
    [(UIKBRenderer *)self watchPathForRenderGeometry:v4];
  }
  else {
  double v7 = [(UIKBRenderer *)self defaultPathForRenderGeometry:v4];
  }

  return v7;
}

- (id)defaultPathForRenderGeometry:(id)a3
{
  id v4 = a3;
  [v4 paddedFrame];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 displayFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  recta.origin.double y = v19;
  uint64_t v20 = [v4 roundRectCorners];
  [v4 roundRectRadius];
  double v22 = v21;
  [(UIKBRenderer *)self _layerPaddedFrame];
  if (CGRectIsNull(v106))
  {
    double v98 = v12;
    double v23 = v10;
  }
  else
  {
    [(UIKBRenderer *)self _layerPaddedFrame];
    CGFloat v6 = v24;
    double v8 = v25;
    double v23 = v26;
    double v98 = v27;
    [(UIKBRenderer *)self _layerRoundRectRadius];
    double v22 = v28;
  }
  double v97 = v22;
  recta.origin.double x = v6;
  if ([v4 popupDirection] == 2)
  {
    v107.origin.double x = v6;
    v107.origin.double y = v8;
    v107.size.double width = v23;
    v107.size.double height = v98;
    double MinY = CGRectGetMinY(v107);
    v108.origin.double x = v14;
    v108.origin.double y = v16;
    v108.size.double width = v18;
    v108.size.double height = recta.origin.y;
    CGFloat v30 = CGRectGetMinY(v108);
    v109.size.double height = recta.origin.y;
    double v31 = MinY - v30;
    v109.origin.double x = v14;
    v109.origin.double y = v16;
    v109.size.double width = v18;
    double MaxY = CGRectGetMaxY(v109);
    v110.origin.double x = recta.origin.x;
    v110.origin.double y = v8;
    v110.size.double width = v23;
    v110.size.double height = v98;
    double v8 = MaxY - CGRectGetHeight(v110) - v31;
  }
  [v4 symbolFrame];
  double v34 = v33;
  double v36 = v35;
  int v37 = [v4 popupBias];
  int v38 = [v4 tallPopup];
  double v39 = 7.0;
  if (v38) {
    double v39 = 1.0;
  }
  double v93 = v39;
  BOOL v40 = v14 + v18 - (v34 + v36) > v36 + 8.0 || v37 == 40;
  BOOL v41 = v34 - v14 > v36 + 8.0 || v37 == 40;
  if (v37 && v41)
  {
    if (v37 == 40)
    {
      [v4 layoutMargins];
      if (v14 + v42 <= -8.0)
      {
        double v14 = v14 + -20.0;
        double v18 = v18 + 20.0;
      }
    }
    v111.origin.double x = v14;
    v111.origin.double y = v16;
    v111.size.double width = v18;
    v111.size.double height = recta.origin.y;
    double x = COERCE_DOUBLE(CGRectInset(v111, 24.0, 0.0)) + 2.0 + -1.0;
    int v37 = 2;
  }
  else
  {
    double x = recta.origin.x;
  }
  if (v37) {
    BOOL v44 = v40;
  }
  else {
    BOOL v44 = 0;
  }
  double v91 = x;
  if (v44)
  {
    v112.origin.double x = v14;
    v112.origin.double y = v16;
    v112.size.double width = v18;
    v112.size.double height = recta.origin.y;
    CGRect v113 = CGRectInset(v112, 24.0, 0.0);
    double v45 = v113.origin.x;
    double width = v113.size.width;
    if (![v4 concaveCorner])
    {
      double v47 = width + -2.0;
      double v48 = v45 + 0.0;
      double v49 = v47 + 1.0;
      int v37 = 2;
      goto LABEL_34;
    }
LABEL_28:
    uint64_t v50 = [(UIKBRenderer *)self pathForConcaveCornerWithGeometry:v4];
LABEL_29:
    double v51 = (void *)v50;
    goto LABEL_30;
  }
  if ([v4 concaveCorner]) {
    goto LABEL_28;
  }
  double v49 = v23;
  double v48 = recta.origin.x;
  if (!v37)
  {
LABEL_35:
    if (v20)
    {
      uint64_t v50 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", [v4 roundRectCorners], recta.origin.x, v8, v23, v98, v97, v97);
      goto LABEL_29;
    }
    double y = v98;
    double v60 = recta.origin.x;
    double v62 = v8;
    double v63 = v23;
LABEL_48:
    uint64_t v50 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v60, v62, v63, y);
    goto LABEL_29;
  }
LABEL_34:
  if ([v4 popupDirection] == 3) {
    goto LABEL_35;
  }
  double v89 = v16;
  double v99 = recta.origin.x + v23 * 0.5;
  double v53 = v16 + recta.origin.y + -6.0;
  if (v37 > 28)
  {
    if (v37 == 29)
    {
      double v51 = +[UIBezierPath bezierPath];
      double v79 = v89 + v93;
      double v80 = recta.origin.x + v23;
      double v96 = v8 + 15.0;
      double v81 = v49 + v48;
      double v82 = v8 + -19.0;
      objc_msgSend(v51, "moveToPoint:", v99, v53);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, recta.origin.x, v53, v97, v97);
      objc_msgSend(v51, "addLineToPoint:", recta.origin.x, v79 + 10.0);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, recta.origin.x, v79, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v81 + 26.0 + -10.0, v79);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v81 + 26.0, v79, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v81 + 26.0, v8 + -19.0);
      if (v40)
      {
        double v83 = (v96 + v82) * 0.5 + -1.5;
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v81 + 26.0, v83, 10.0, 10.0);
        objc_msgSend(v51, "addLineToPoint:", v80 + 10.0, v83);
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v80, v83, 10.0, 10.0);
      }
      else
      {
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v81 + 23.75, v8 + -12.5, v81 + 26.0 + -0.5, v82 + 5.0);
        objc_msgSend(v51, "addLineToPoint:", v80 + 2.75, v8 + 7.5);
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v80, v96, v80 + 0.5, v96 + -5.0);
      }
      objc_msgSend(v51, "addLineToPoint:", v80, v53 - v97);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v80, v53, v97, v97);
      double v84 = v51;
      double v85 = v99;
      double v86 = v53;
      goto LABEL_61;
    }
    if (v37 != 30)
    {
LABEL_47:
      double v60 = v14;
      double v62 = v89;
      double v63 = v18;
      double y = recta.origin.y;
      goto LABEL_48;
    }
  }
  else if (v37 != 2)
  {
    if (v37 == 21)
    {
      double v51 = +[UIBezierPath bezierPath];
      double v54 = v23;
      double v55 = v8 + 15.0;
      double v56 = v91 + -26.0;
      double v57 = v8 + -19.0;
      double v58 = v89 + v93;
      double v94 = recta.origin.x + v54;
      objc_msgSend(v51, "moveToPoint:", v99, v53);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, recta.origin.x, v53, v97, v97);
      objc_msgSend(v51, "addLineToPoint:", recta.origin.x, v8 + 15.0);
      if (v41)
      {
        double v59 = (v55 + v57) * 0.5 + -1.5;
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, recta.origin.x, v59, 10.0, 10.0);
        objc_msgSend(v51, "addLineToPoint:", v56 + 10.0, v59);
        objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v56, v59, 10.0, 10.0);
      }
      else
      {
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", recta.origin.x + -2.75, v8 + 7.5, recta.origin.x + -0.5, v55 + -5.0);
        objc_msgSend(v51, "addLineToPoint:", v91 + -23.75, v8 + -12.5);
        objc_msgSend(v51, "addQuadCurveToPoint:controlPoint:", v56, v8 + -19.0, v56 + 0.5, v57 + 5.0);
      }
      objc_msgSend(v51, "addLineToPoint:", v56, v58 + 10.0);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v56, v58, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v94 + -10.0, v58);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v94, v58, 10.0, 10.0);
      objc_msgSend(v51, "addLineToPoint:", v94, v53 - v97);
      objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v94, v53, v97, v97);
      double v84 = v51;
      double v85 = v99;
      double v86 = v53;
LABEL_61:
      objc_msgSend(v84, "addLineToPoint:", v85, v86);
      [v51 closePath];
      goto LABEL_30;
    }
    goto LABEL_47;
  }
  double v88 = v23;
  double v51 = +[UIBezierPath bezierPath];
  double v64 = v8 + 1.5;
  double v65 = v8 + -9.0;
  double v66 = v91 + -13.0;
  double v67 = v53;
  double v68 = v89 + v93;
  double v92 = v8 + -8.0;
  double v95 = v8 + -20.0;
  double v69 = (v8 + 1.5 + v8 + -20.0) * 0.5 + -1.5;
  double v70 = v49 + v48;
  double v71 = v67;
  double v72 = v70 + 13.0;
  objc_msgSend(v51, "moveToPoint:", v99, v67);
  recta.origin.double y = v71;
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, recta.origin.x, v71, v97, v97);
  double v90 = v64;
  objc_msgSend(v51, "addLineToPoint:", recta.origin.x, v64);
  double v87 = v65;
  if (v41)
  {
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, recta.origin.x, v69, 10.0, 10.0);
    objc_msgSend(v51, "addLineToPoint:", v66 + 10.0, v69);
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v66, v69, 10.0, 10.0);
    double v73 = v69;
    double v74 = v92;
  }
  else
  {
    double v75 = v65;
    double v74 = v92;
    objc_msgSend(v51, "addCurveToPoint:controlPoint1:controlPoint2:", v66, v95, recta.origin.x, v75, v66, v92);
    double v73 = v69;
  }
  double v76 = recta.origin.x + v88;
  objc_msgSend(v51, "addLineToPoint:", v66, v68 + 10.0);
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v66, v68, 10.0, 10.0);
  objc_msgSend(v51, "addLineToPoint:", v72 + -10.0, v68);
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v72, v68, 10.0, 10.0);
  objc_msgSend(v51, "addLineToPoint:", v72, v95);
  if (v40)
  {
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v72, v73, 10.0, 10.0);
    objc_msgSend(v51, "addLineToPoint:", v76 + 10.0, v73);
    objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v76, v73, 10.0, 10.0);
  }
  else
  {
    objc_msgSend(v51, "addCurveToPoint:controlPoint1:controlPoint2:", v76, v90, v72, v74, v76, v87);
  }
  objc_msgSend(v51, "addLineToPoint:", v76, recta.origin.y - v97);
  objc_msgSend(v51, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v76, recta.origin.y, v97, v97);
  objc_msgSend(v51, "addLineToPoint:", v99, recta.origin.y);
  [v51 closePath];
  if ([v4 popupDirection] == 2)
  {
    memset(&v104, 0, sizeof(v104));
    CGAffineTransformMakeScale(&v104, 1.0, -1.0);
    memset(&v103, 0, sizeof(v103));
    [v51 bounds];
    double v77 = CGRectGetMinY(v114);
    [v51 bounds];
    CGFloat v78 = CGRectGetMaxY(v115);
    CGAffineTransformMakeTranslation(&v103, 0.0, v77 + v78);
    recta.size = *(CGSize *)&v104.a;
    long long v101 = *(_OWORD *)&v104.c;
    long long v102 = *(_OWORD *)&v104.tx;
    [v51 applyTransform:&recta.size];
    recta.size = *(CGSize *)&v103.a;
    long long v101 = *(_OWORD *)&v103.c;
    long long v102 = *(_OWORD *)&v103.tx;
    [v51 applyTransform:&recta.size];
  }
LABEL_30:

  return v51;
}

- (id)watchPathForRenderGeometry:(id)a3
{
  id v3 = a3;
  id v4 = +[UIBezierPath bezierPath];
  [v3 paddedFrame];
  double v6 = v5;
  double v42 = v8;
  double v45 = v7;
  double v10 = v9;
  [v3 displayFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [v3 roundRectRadius];
  double v20 = v19;
  [v3 roundRectRadius];
  double v22 = v21;
  int v23 = [v3 popupBias];
  if (v23 > 28)
  {
    if (v23 == 29)
    {
      double v37 = v6 + v10 * 0.5;
      double v24 = v14 + v18;
      double v38 = v12 + v16;
      double v39 = v6 + v10;
      double v40 = v37;
      objc_msgSend(v4, "moveToPoint:");
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v12, v24, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v12, v14, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v38, v14, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v38, v45, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 1, v39, v45, v20, v22);
      objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v39, v24, v20, v22);
      double v34 = v4;
      double v35 = v40;
      goto LABEL_11;
    }
    if (v23 != 30)
    {
LABEL_9:
      uint64_t v36 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", [v3 roundRectCorners], v6, v45, v10, v42, v20, v22);

      id v4 = (void *)v36;
      goto LABEL_12;
    }
LABEL_7:
    double v44 = v6 + v10 * 0.5;
    double v24 = v14 + v18;
    double v33 = v12 + v16;
    double v25 = v6 + v10;
    [v4 moveToPoint:*(void *)&v44];
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v6, v24, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, v6, v45, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v12, v45, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v12, v14, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v33, v14, v20, v22);
    objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v33, v45, v20, v22);
    double v26 = v4;
    double v27 = v25;
    double v28 = v45;
    double v29 = v20;
    double v30 = v22;
    uint64_t v32 = 1;
    uint64_t v31 = 1;
    goto LABEL_8;
  }
  if (v23 == 2) {
    goto LABEL_7;
  }
  if (v23 != 21) {
    goto LABEL_9;
  }
  double v43 = v6 + v10 * 0.5;
  double v24 = v14 + v18;
  double v25 = v6 + v10;
  objc_msgSend(v4, "moveToPoint:");
  objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v6, v24, v20, v22);
  objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 1, v6, v45, v20, v22);
  objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v12, v45, v20, v22);
  objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v12, v14, v20, v22);
  double v26 = v4;
  double v27 = v12 + v16;
  double v28 = v14;
  double v29 = v20;
  double v30 = v22;
  uint64_t v31 = 0;
  uint64_t v32 = 2;
LABEL_8:
  objc_msgSend(v26, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", v32, v31, v27, v28, v29, v30);
  objc_msgSend(v4, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v25, v24, v20, v22);
  double v34 = v4;
  double v35 = v43;
LABEL_11:
  objc_msgSend(v34, "addLineToPoint:", v35, v24);
LABEL_12:
  [v4 closePath];

  return v4;
}

- (id)pathForFlickWidth:(double)a3 height:(double)a4 handleLength:(double)a5 keyMiddle:(CGPoint)a6 angle:(double)a7 radius:(double)a8
{
  CGFloat y = a6.y;
  double x = a6.x;
  double v15 = +[UIBezierPath bezierPath];
  [(UIKBRenderer *)self scale];
  double v17 = v16;
  UIRoundToScale(a3 * 0.5 + -8.0, v16);
  double v19 = v18 + v18;
  UIRoundToScale(a4 + -16.0, v17);
  double v21 = v20;
  UIRoundToScale(a5 * 0.6, v17);
  id v23 = 0;
  if (v19 > 0.0 && v21 > 0.0)
  {
    double v24 = v22;
    if (v22 > 0.0 && v22 > 8.0)
    {
      double v36 = y;
      double angle = a7;
      double v26 = atan((v22 + -8.0 + v22 + -8.0) / v19);
      double v27 = v19 * -0.5;
      double v28 = v19 * 0.5;
      __double2 v29 = __sincos_stret(v26);
      double v30 = -a4 - v24;
      objc_msgSend(v15, "moveToPoint:", v29.__sinval * a8, v29.__cosval * a8 - a8);
      objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 0.0, -a8, a8);
      objc_msgSend(v15, "addLineToPoint:", v27 + v29.__sinval * -8.0, v29.__cosval * 8.0 - v24);
      objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, -v24, 8.0, v26 + 1.57079633, 3.14159265);
      objc_msgSend(v15, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v27 + -8.0, v30, 8.0, 8.0);
      objc_msgSend(v15, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v28 + 8.0, v30, 8.0, 8.0);
      objc_msgSend(v15, "addLineToPoint:", v28 + 8.0, -v24);
      objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, -v24, 8.0, 0.0, 1.57079633 - v26);
      [v15 closePath];
      memset(&v41, 0, sizeof(v41));
      UIRoundToScale(x, v17);
      CGFloat v32 = v31;
      UIRoundToScale(v36, v17);
      CGAffineTransformMakeTranslation(&v41, v32, v33);
      CGAffineTransform v39 = v41;
      CGAffineTransformRotate(&v40, &v39, angle);
      CGAffineTransform v41 = v40;
      UIRoundToScale(v24 * -0.6, v17);
      CGAffineTransform v39 = v41;
      CGAffineTransformTranslate(&v40, &v39, 0.0, v34);
      CGAffineTransform v41 = v40;
      [v15 applyTransform:&v40];
      id v23 = v15;
    }
  }

  return v23;
}

- (id)pathForFlickGeometry:(id)a3
{
  id v4 = a3;
  [v4 paddedFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 popupSource];
  double v14 = v13;
  double v16 = v15;
  if (![v4 flickDirection])
  {
    double v17 = v16 - (v8 + v12);
    double v18 = 0.0;
LABEL_7:
    double v19 = 8.0;
    double v20 = self;
    double v21 = v10;
    double v22 = v12;
LABEL_11:
    id v23 = -[UIKBRenderer pathForFlickWidth:height:handleLength:keyMiddle:angle:radius:](v20, "pathForFlickWidth:height:handleLength:keyMiddle:angle:radius:", v21, v22, v17, v14, v16, v18, v19);
    goto LABEL_12;
  }
  if ([v4 flickDirection] == 1)
  {
    double v17 = v6 - v14;
    double v18 = 1.57079633;
LABEL_10:
    double v19 = 8.0;
    double v20 = self;
    double v21 = v12;
    double v22 = v10;
    goto LABEL_11;
  }
  if ([v4 flickDirection] == 2)
  {
    double v17 = v8 - v16;
    double v18 = 3.14159265;
    goto LABEL_7;
  }
  if ([v4 flickDirection] == 3)
  {
    double v17 = v14 - (v6 + v10);
    double v18 = -1.57079633;
    goto LABEL_10;
  }
  id v23 = 0;
LABEL_12:

  return v23;
}

- (id)pathForFlickPopupGeometries:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (unint64_t)[v3 count] >= 2)
  {
    double v6 = [v4 objectAtIndex:0];
    double v7 = [v4 objectAtIndex:4];
    double v8 = [MEMORY[0x1E4F1CA98] null];
    if (v7 == v8) {
      double v9 = 0;
    }
    else {
      double v9 = v7;
    }
    id v10 = v9;

    double v11 = [v4 objectAtIndex:2];
    double v12 = [MEMORY[0x1E4F1CA98] null];
    if (v11 == v12) {
      double v13 = 0;
    }
    else {
      double v13 = v11;
    }
    id v14 = v13;

    double v15 = [v4 objectAtIndex:1];
    double v16 = [MEMORY[0x1E4F1CA98] null];
    if (v15 == v16) {
      double v17 = 0;
    }
    else {
      double v17 = v15;
    }
    id v18 = v17;

    double v19 = [v4 objectAtIndex:3];
    double v20 = [MEMORY[0x1E4F1CA98] null];
    if (v19 == v20) {
      double v21 = 0;
    }
    else {
      double v21 = v19;
    }
    id v22 = v21;

    double v5 = +[UIBezierPath bezierPath];
    [v6 paddedFrame];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v23 + v29;
    objc_msgSend(v5, "moveToPoint:");
    if (v18)
    {
      [v18 paddedFrame];
      double v32 = v31;
      double v35 = v33 + v34;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v35, v32, 8.0, 8.0);
    }
    double v36 = v26 + v28;
    objc_msgSend(v5, "addLineToPoint:", v30, v26);
    if (v14)
    {
      [v14 paddedFrame];
      double v39 = v37 + v38;
      double v42 = v40 + v41;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, v37 + v38);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v39, v42, 8.0, 8.0);
    }
    objc_msgSend(v5, "addLineToPoint:", v30, v36);
    if (v22)
    {
      [v22 paddedFrame];
      double v44 = v43;
      double v48 = v46 + v47;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v43 + v45, v46 + v47, 8.0, 8.0);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v44, v48, 8.0, 8.0);
    }
    objc_msgSend(v5, "addLineToPoint:", v24, v36);
    if (v10)
    {
      [v10 paddedFrame];
      double v50 = v49;
      double v52 = v51;
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0);
      objc_msgSend(v5, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, v50, v52, 8.0, 8.0);
    }
    objc_msgSend(v5, "addLineToPoint:", v24, v26);
    [v5 closePath];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)pathForSplitGeometry:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4
    && ([v4 splitLeftRect], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (double v7 = (void *)v6,
        [v5 splitRightRect],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    double v9 = [v5 splitLeftRect];
    [v9 CGRectValue];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    id v18 = [v5 splitRightRect];
    [v18 CGRectValue];
    double v35 = v20;
    double v36 = v19;
    double v22 = v21;

    [(UIKBRenderer *)self size];
    double v24 = v23 - v22;
    uint64_t v25 = [v5 roundRectCorners] & 0xA;
    uint64_t v26 = [v5 roundRectCorners] & 5;
    [v5 roundRectRadius];
    double v28 = v27;
    [v5 roundRectRadius];
    double v30 = v29;
    double v31 = +[UIBezierPath bezierPath];
    double v32 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v25, v11, v13, v15, v17, v28, v30);
    [v31 appendPath:v32];

    double v33 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v26, v24, v36, v22, v35, v28, v30);
    [v31 appendPath:v33];
  }
  else
  {
    double v31 = 0;
  }

  return v31;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (int64_t)renderFlags
{
  return self->_renderFlags;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (BOOL)colorDetectMode
{
  return self->_colorDetectMode;
}

- (void)setColorDetectMode:(BOOL)a3
{
  self->_BOOL colorDetectMode = a3;
}

- (int64_t)assetIdiom
{
  return self->_assetIdiom;
}

- (BOOL)disableInternalCaching
{
  return self->_disableInternalCaching;
}

- (void)setDisableInternalCaching:(BOOL)a3
{
  self->_disableInternalCaching = a3;
}

- (CGRect)_layerPaddedFrame
{
  double x = self->__layerPaddedFrame.origin.x;
  double y = self->__layerPaddedFrame.origin.y;
  double width = self->__layerPaddedFrame.size.width;
  double height = self->__layerPaddedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_layerPaddedFrame:(CGRect)a3
{
  self->__layerPaddedFrame = a3;
}

- (double)_layerRoundRectRadius
{
  return self->__layerRoundRectRadius;
}

- (void)set_layerRoundRectRadius:(double)a3
{
  self->__layerRoundRectRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedImage, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_singleColor, 0);
  objc_storeStrong(&self->_cachingContextCompletion, 0);
}

@end