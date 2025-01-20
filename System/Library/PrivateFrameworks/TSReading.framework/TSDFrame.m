@interface TSDFrame
+ (Class)mutableClass;
- (BOOL)canApplyDirectlyToRepCALayer;
- (BOOL)canApplyToCAShapeLayer;
- (BOOL)drawsInOneStep;
- (BOOL)hasMask;
- (BOOL)i_willRenderForRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrame;
- (BOOL)isNullStroke;
- (BOOL)prefersToApplyToShapeRenderableDuringManipulation;
- (BOOL)shouldRender;
- (BOOL)shouldRenderForSizeIncludingCoverage:(CGSize)a3;
- (BOOL)supportsColor;
- (BOOL)supportsLineOptions;
- (BOOL)supportsPattern;
- (CGRect)coverageRect:(CGRect)a3;
- (CGRect)coverageRectWithoutAdornment:(CGRect)a3;
- (CGRect)i_adornmentRectForRect:(CGRect)a3;
- (CGRect)p_coverageRectWithAdornment:(CGRect)a3;
- (CGRect)p_coverageRectWithoutAdornment:(CGRect)a3;
- (CGSize)p_minimumRenderedSize;
- (TSDFrame)initWithFrameName:(id)a3;
- (TSDFrame)initWithFrameSpec:(id)a3;
- (TSDFrame)initWithFrameSpec:(id)a3 assetScale:(double)a4;
- (TSDFrame)initWithFrameSpec:(id)a3 assetScale:(double)a4 archivableFrameName:(id)a5;
- (TSDFrameSpec)frameSpec;
- (_TSDStrokeOutsets)outsets;
- (double)assetScale;
- (double)i_bottomHeight;
- (double)i_leftWidth;
- (double)i_rightWidth;
- (double)i_topHeight;
- (double)minimumAssetScale;
- (id)archivableFrameName;
- (id)description;
- (id)frameName;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6;
@end

@implementation TSDFrame

- (TSDFrame)initWithFrameSpec:(id)a3 assetScale:(double)a4 archivableFrameName:(id)a5
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4);
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDFrame initWithFrameSpec:assetScale:archivableFrameName:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 81, @"invalid nil value for '%s'", "spec");
    if (a5) {
      goto LABEL_3;
    }
  }
  v13 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4);
  uint64_t v14 = [NSString stringWithUTF8String:"-[TSDFrame initWithFrameSpec:assetScale:archivableFrameName:]"];
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 82, @"invalid nil value for '%s'", "archivableFrameName");
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)TSDFrame;
  v8 = -[TSDStroke initWithColor:width:cap:join:pattern:](&v17, sel_initWithColor_width_cap_join_pattern_, objc_msgSend(MEMORY[0x263F7C808], "blackColor", a4), 0, 0, +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"), 2.0);
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      v8->mSpec = (TSDFrameSpec *)[a3 copy];
      v9->mFrameName = (NSString *)[a5 copy];
      [(TSDFrameSpec *)v9->mSpec i_minimumAssetScale];
      TSUClamp();
      v9->mAssetScale = v10;
      p_calculateDerivedValuesFromFrameSpecAndAssetScale(v9->mSpec, &v9->mLeftWidth, &v9->mRightWidth, &v9->mTopHeight, &v9->mBottomHeight, (uint64_t)&v9->mAdornmentSize, v10);
    }
    else
    {
      v15 = v8;
      return 0;
    }
  }
  return v9;
}

- (TSDFrame)initWithFrameSpec:(id)a3 assetScale:(double)a4
{
  uint64_t v7 = [a3 frameName];

  return [(TSDFrame *)self initWithFrameSpec:a3 assetScale:v7 archivableFrameName:a4];
}

- (TSDFrame)initWithFrameSpec:(id)a3
{
  return [(TSDFrame *)self initWithFrameSpec:a3 assetScale:1.0];
}

- (TSDFrame)initWithFrameName:(id)a3
{
  v4 = +[TSDFrameSpec frameSpecWithName:a3];

  return [(TSDFrame *)self initWithFrameSpec:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDFrame;
  [(TSDFrame *)&v3 dealloc];
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TSDMutableFrame allocWithZone:a3];
  v5 = [(TSDFrame *)self frameSpec];
  [(TSDFrame *)self assetScale];
  double v7 = v6;
  id v8 = [(TSDFrame *)self archivableFrameName];

  return [(TSDFrame *)v4 initWithFrameSpec:v5 assetScale:v8 archivableFrameName:v7];
}

- (BOOL)isEqual:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSDFrame;
  LODWORD(v4) = -[TSDStroke isEqual:](&v11, sel_isEqual_);
  if (v4)
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      mSpec = self->mSpec;
      if (mSpec == (TSDFrameSpec *)[v4 frameSpec])
      {
        LODWORD(v4) = -[NSString isEqualToString:](self->mFrameName, "isEqualToString:", [v5 archivableFrameName]);
        if (v4)
        {
          [(TSDFrame *)self assetScale];
          double v8 = v7;
          [v5 assetScale];
          LOBYTE(v4) = v8 == v9;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

- (unint64_t)hash
{
  v4.receiver = self;
  v4.super_class = (Class)TSDFrame;
  [(TSDStroke *)&v4 hash];
  [(TSDFrameSpec *)self->mSpec hash];
  [(NSString *)self->mFrameName hash];
  return TSUHashWithSeed();
}

- (id)description
{
  objc_super v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(TSDFrame *)self frameName];
  [(TSDFrame *)self assetScale];
  return (id)[v3 stringWithFormat:@"<%@ %p frameName='%@' assetScale=%f>", v5, self, v6, v7];
}

- (id)frameName
{
  v2 = [(TSDFrame *)self frameSpec];

  return [(TSDFrameSpec *)v2 frameName];
}

- (id)archivableFrameName
{
  id result = self->mFrameName;
  if (!result)
  {
    objc_super v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDFrame archivableFrameName]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 194, @"invalid nil value for '%s'", "mFrameName");
    id result = self->mFrameName;
    if (!result)
    {
      id v6 = [(TSDFrame *)self frameSpec];
      return [(TSDFrameSpec *)v6 frameName];
    }
  }
  return result;
}

- (double)minimumAssetScale
{
  v2 = [(TSDFrame *)self frameSpec];

  [(TSDFrameSpec *)v2 i_minimumAssetScale];
  return result;
}

- (BOOL)hasMask
{
  v2 = [(TSDFrame *)self frameSpec];

  return [(TSDFrameSpec *)v2 i_hasMask];
}

- (CGRect)p_coverageRectWithoutAdornment:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(TSDFrameSpec *)self->mSpec i_hasImages]) {
    BOOL v8 = width < 2.0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && height >= 2.0)
  {
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    CGRect v28 = CGRectInset(v27, 1.0, 1.0);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;
  }
  [(TSDFrameSpec *)self->mSpec i_leftInset];
  *(float *)&double v10 = v10 * self->mAssetScale;
  double v11 = ceilf(*(float *)&v10);
  [(TSDFrameSpec *)self->mSpec i_rightInset];
  *(float *)&double v12 = v12 * self->mAssetScale;
  double v13 = ceilf(*(float *)&v12);
  [(TSDFrameSpec *)self->mSpec i_bottomInset];
  *(float *)&double v14 = v14 * self->mAssetScale;
  double v15 = ceilf(*(float *)&v14);
  [(TSDFrameSpec *)self->mSpec i_topInset];
  *(float *)&double v16 = v16 * self->mAssetScale;
  double v17 = ceilf(*(float *)&v16);
  double v18 = y + v17;
  double v19 = height - (v15 + v17);
  double mLeftWidth = self->mLeftWidth;
  double v21 = x + v11 - mLeftWidth;
  double v22 = mLeftWidth + self->mRightWidth;
  double mTopHeight = self->mTopHeight;
  double v24 = width - (v11 + v13) + v22;
  double v25 = v18 - mTopHeight;
  double v26 = v19 + mTopHeight + self->mBottomHeight;
  result.size.double height = v26;
  result.size.double width = v24;
  result.origin.double y = v25;
  result.origin.double x = v21;
  return result;
}

- (CGRect)p_coverageRectWithAdornment:(CGRect)a3
{
  -[TSDFrame p_coverageRectWithoutAdornment:](self, "p_coverageRectWithoutAdornment:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(TSDFrameSpec *)self->mSpec i_hasAdornment])
  {
    -[TSDFrame i_adornmentRectForRect:](self, "i_adornmentRectForRect:", v5, v7, v9, v11);
    double v5 = TSDUnionRect(v12, v13, v14, v15, v5, v7, v9, v11);
    double v7 = v16;
    double v9 = v17;
    double v11 = v18;
  }
  double v19 = v5;
  double v20 = v7;
  double v21 = v9;
  double v22 = v11;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)coverageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[TSDFrame p_coverageRectWithAdornment:](self, "p_coverageRectWithAdornment:");
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(TSDFrame *)self p_minimumRenderedSize];
  if (v13 < v17 || v15 < v16)
  {
    double v15 = height;
    double v13 = width;
    CGFloat v11 = y;
    CGFloat v9 = x;
  }
  double v19 = v9;
  double v20 = v11;
  double v21 = v13;
  double v22 = v15;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)coverageRectWithoutAdornment:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[TSDFrame coverageRect:](self, "coverageRect:");
  v22.origin.double x = v8;
  v22.origin.double y = v9;
  v22.size.double width = v10;
  v22.size.double height = v11;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (!CGRectEqualToRect(v20, v22))
  {
    -[TSDFrame p_coverageRectWithoutAdornment:](self, "p_coverageRectWithoutAdornment:", x, y, width, height);
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)isFrame
{
  return 1;
}

- (BOOL)supportsPattern
{
  return 0;
}

- (BOOL)supportsColor
{
  return 0;
}

- (BOOL)supportsLineOptions
{
  return 0;
}

- (BOOL)shouldRender
{
  return 1;
}

- (BOOL)shouldRenderForSizeIncludingCoverage:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TSDFrame *)self p_minimumRenderedSize];
  return height >= v6 && width >= v5;
}

- (_TSDStrokeOutsets)outsets
{
  double v3 = 0.0;
  if ([(TSDFrameSpec *)self->mSpec i_hasAdornment])
  {
    double v4 = self->mTopHeight * 0.5;
    [(TSDFrameSpec *)self->mSpec i_adornmentPosition];
    double v3 = v4 + v5 - self->mAdornmentSize.height * 0.5;
    if (v3 > 0.0) {
      double v3 = 0.0;
    }
  }
  double mLeftWidth = self->mLeftWidth;
  [(TSDFrameSpec *)self->mSpec i_leftInset];
  double v8 = mLeftWidth - v7 * self->mAssetScale;
  double mRightWidth = self->mRightWidth;
  [(TSDFrameSpec *)self->mSpec i_rightInset];
  double v11 = mRightWidth - v10 * self->mAssetScale;
  double mTopHeight = self->mTopHeight;
  [(TSDFrameSpec *)self->mSpec i_topInset];
  double v14 = mTopHeight - v13 * self->mAssetScale - v3;
  double mBottomHeight = self->mBottomHeight;
  [(TSDFrameSpec *)self->mSpec i_bottomInset];
  double v17 = mBottomHeight - v16 * self->mAssetScale;
  double v18 = v8;
  double v19 = v11;
  double v20 = v14;
  result.var3 = v17;
  result.var2 = v20;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (BOOL)isNullStroke
{
  return 0;
}

- (BOOL)canApplyDirectlyToRepCALayer
{
  return ![(TSDFrame *)self shouldRender];
}

- (BOOL)canApplyToCAShapeLayer
{
  return 0;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6
{
  if (a4)
  {
    CGFloat v9 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4, a5, a6);
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDFrame paintPath:wantsInteriorStroke:inContext:useFastDrawing:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 365, @"Can't draw interior frame stroke");
  }
  double v14 = [[TSDFrameRep alloc] initWithTSDFrame:self];
  TSUScreenScale();
  if (v11 != TSDCGContextAssociatedScreenScale((uint64_t)a5))
  {
    double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDFrame paintPath:wantsInteriorStroke:inContext:useFastDrawing:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 368, @"rendering a frame into a context with incorrect associated screen scale");
  }
  BoundingBodouble x = CGPathGetBoundingBox(a3);
  -[TSDFrameRep frameRect:inContext:withTotalScale:](v14, "frameRect:inContext:withTotalScale:", a5, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height, TSDCGContextAssociatedScreenScale((uint64_t)a5));
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double width = a3.size.width;
  double x = a3.origin.x;
  if ([(TSDFrameSpec *)self->mSpec i_hasAdornment])
  {
    CGFloat v8 = self->mAdornmentSize.height * 0.5;
    [(TSDFrameSpec *)self->mSpec i_adornmentPosition];
    double y = y + v8 - v9;
    double height = height - (v8 - v9);
  }
  [(TSDFrameSpec *)self->mSpec i_leftInset];
  double v37 = v10;
  double mAssetScale = self->mAssetScale;
  [(TSDFrameSpec *)self->mSpec i_rightInset];
  double v35 = v11;
  double v34 = self->mAssetScale;
  [(TSDFrameSpec *)self->mSpec i_bottomInset];
  double v13 = v12;
  double v14 = self->mAssetScale;
  [(TSDFrameSpec *)self->mSpec i_topInset];
  double v16 = v15;
  double v17 = self->mAssetScale;
  double mLeftWidth = self->mLeftWidth;
  double mRightWidth = self->mRightWidth;
  double mTopHeight = self->mTopHeight;
  double mBottomHeight = self->mBottomHeight;
  v40 = [[TSDFrameRep alloc] initWithTSDFrame:self];
  TSUScreenScale();
  if (v21 != TSDCGContextAssociatedScreenScale((uint64_t)a4))
  {
    CGRect v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"-[TSDFrame drawSwatchInRect:inContext:]"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrame.m"), 409, @"rendering a frame into a context with incorrect associated screen scale");
  }
  float v24 = v13 * v14;
  float v25 = v16 * v17;
  double v26 = ceilf(v25);
  double v27 = v31 + ceilf(v24) + v26 - (mTopHeight + mBottomHeight);
  double v28 = v32 - v26 + mTopHeight;
  float v29 = v37 * mAssetScale;
  double v30 = ceilf(v29);
  *(float *)&double v26 = v35 * v34;
  -[TSDFrameRep frameRect:inContext:withTotalScale:](v40, "frameRect:inContext:withTotalScale:", a4, x - v30 + mLeftWidth, v28, width + v30 + ceilf(*(float *)&v26) - (mLeftWidth + mRightWidth), v27, TSDCGContextAssociatedScreenScale((uint64_t)a4));
}

- (CGSize)p_minimumRenderedSize
{
  double v2 = self->mLeftWidth + self->mRightWidth;
  double v3 = self->mBottomHeight + self->mTopHeight;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)assetScale
{
  return self->mAssetScale;
}

- (TSDFrameSpec)frameSpec
{
  return self->mSpec;
}

- (double)i_leftWidth
{
  return self->mLeftWidth;
}

- (double)i_rightWidth
{
  return self->mRightWidth;
}

- (double)i_topHeight
{
  return self->mTopHeight;
}

- (double)i_bottomHeight
{
  return self->mBottomHeight;
}

- (CGRect)i_adornmentRectForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = CGRectGetWidth(a3) - (self->mLeftWidth + self->mRightWidth);
  [(TSDFrameSpec *)self->mSpec i_adornmentPosition];
  CGFloat v10 = v8 * v9;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v11 = v10 + CGRectGetMinX(v19) + self->mLeftWidth;
  double v12 = self->mTopHeight * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v20);
  [(TSDFrameSpec *)self->mSpec i_adornmentPosition];
  double v15 = self->mAdornmentSize.width;
  double v16 = self->mAdornmentSize.height;
  double v17 = v11 - v15 * 0.5;
  double v18 = v12 + MinY + v14 - v16 * 0.5;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)i_willRenderForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TSDFrame *)self p_minimumRenderedSize];
  double v9 = v8;
  double v11 = v10;
  -[TSDFrame p_coverageRectWithAdornment:](self, "p_coverageRectWithAdornment:", x, y, width, height);
  return v13 >= v11 && v12 >= v9;
}

- (id)strokeByTransformingByTransform:(CGAffineTransform *)a3
{
  [(TSDFrame *)self assetScale];
  [(TSDFrame *)self minimumAssetScale];
  TSUClamp();
  double v5 = [[TSDFrame alloc] initWithFrameSpec:[(TSDFrame *)self frameSpec] assetScale:v4];

  return v5;
}

@end