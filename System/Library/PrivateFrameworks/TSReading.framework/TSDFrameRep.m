@interface TSDFrameRep
- (CGImage)p_newFrameForMask:(BOOL)a3 size:(CGSize)a4 forCALayer:(BOOL)a5 viewScale:(double)a6;
- (CGImage)p_newRenderedFrameForMask:(BOOL)a3 size:(CGSize)a4 forCALayer:(BOOL)a5 viewScale:(double)a6;
- (TSDFrameRep)initWithTSDFrame:(id)a3;
- (id)applyToCALayer:(id)a3 withRepLayer:(id)a4 maskLayer:(id)a5 viewScale:(double)a6;
- (id)frame;
- (id)p_createRepeatingLayerWithImage:(CGImage *)a3 vertical:(BOOL)a4 screenScale:(double)a5;
- (void)applyMaskForRectWithCoverage:(CGRect)a3 toContext:(CGContext *)a4;
- (void)blendMaskBeforeRenderingImageInContext:(CGContext *)a3;
- (void)dealloc;
- (void)frameRect:(CGRect)a3 inContext:(CGContext *)a4 withTotalScale:(double)a5;
- (void)p_addEdgeLayerForIndex:(unsigned int)a3 toLayer:(id)a4 maskLayer:(id)a5;
- (void)p_addUnreplicatedLayerForIndex:(unsigned int)a3 toLayer:(id)a4 maskLayer:(id)a5;
- (void)p_adjustRepeatingLayer:(id)a3 withImageRect:(CGRect)a4 start:(double)a5 end:(double)a6 vertical:(BOOL)a7;
- (void)p_drawFrameIntoRect:(CGRect)a3 inContext:(CGContext *)a4 withImages:(id)a5 atViewScale:(double)a6 isMask:(BOOL)a7;
- (void)p_drawTiles:(id)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 start:(double)a6 end:(double)a7 vertical:(BOOL)a8;
- (void)p_setRepeatingLayerWithIndex:(unsigned int)a3 sublayers:(id)a4 maskLayers:(id)a5 toRect:(CGRect)a6 start:(double)a7 end:(double)a8;
- (void)p_setUnreplicatedLayerWithIndex:(unsigned int)a3 sublayers:(id)a4 maskLayers:(id)a5 toRect:(CGRect)a6;
- (void)updateCALayer:(id)a3 toRect:(CGRect)a4 withRepLayer:(id)a5 maskLayer:(id)a6 viewScale:(double)a7 maskLayerTransform:(CGAffineTransform *)a8;
@end

@implementation TSDFrameRep

- (TSDFrameRep)initWithTSDFrame:(id)a3
{
  if (!a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDFrameRep initWithTSDFrame:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 70, @"invalid nil value for '%s'", "frame");
  }
  v22.receiver = self;
  v22.super_class = (Class)TSDFrameRep;
  v7 = [(TSDFrameRep *)&v22 init];
  if (v7)
  {
    v8 = (TSDFrame *)a3;
    v7->mFrame = v8;
    v9 = [(TSDFrame *)v8 frameSpec];
    if (!v9)
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSDFrameRep initWithTSDFrame:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 76, @"invalid nil value for '%s'", "frameSpec");
    }
    [(TSDFrameSpec *)v9 i_addInterestInProviders];
    if ([(TSDFrameSpec *)v9 i_hasImages])
    {
      uint64_t v12 = 0;
      v7->mImages = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      do
      {
        id v13 = [(TSDFrameSpec *)v9 i_providerForIndex:v12 mask:0];
        if (!v13)
        {
          v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v15 = [NSString stringWithUTF8String:"-[TSDFrameRep initWithTSDFrame:]"];
          objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 83, @"invalid nil value for '%s'", "provider");
        }
        [(NSArray *)v7->mImages addObject:v13];
        [v13 addInterest];
        uint64_t v12 = (v12 + 1);
      }
      while (v12 != 8);
    }
    if ([(TSDFrameSpec *)v9 i_hasMask])
    {
      uint64_t v16 = 0;
      v7->mMasks = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      do
      {
        id v17 = [(TSDFrameSpec *)v9 i_providerForIndex:v16 mask:1];
        if (!v17)
        {
          v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v19 = [NSString stringWithUTF8String:"-[TSDFrameRep initWithTSDFrame:]"];
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 93, @"invalid nil value for '%s'", "provider");
        }
        [(NSArray *)v7->mMasks addObject:v17];
        [v17 addInterest];
        uint64_t v16 = (v16 + 1);
      }
      while (v16 != 8);
    }
    if ([(TSDFrameSpec *)v9 i_hasAdornment])
    {
      v20 = (TSDBitmapImageProvider *)[(TSDFrameSpec *)v9 i_providerForIndex:8 mask:0];
      v7->mAdornment = v20;
      [(TSDImageProvider *)v20 addInterest];
    }
  }
  return v7;
}

- (void)dealloc
{
  [(NSArray *)self->mImages makeObjectsPerformSelector:sel_removeInterest];
  [(NSArray *)self->mMasks makeObjectsPerformSelector:sel_removeInterest];
  [(TSDImageProvider *)self->mAdornment removeInterest];

  [(TSDFrameSpec *)[(TSDFrame *)self->mFrame frameSpec] i_removeInterestInProviders];
  v3.receiver = self;
  v3.super_class = (Class)TSDFrameRep;
  [(TSDFrameRep *)&v3 dealloc];
}

- (id)frame
{
  return self->mFrame;
}

- (void)frameRect:(CGRect)a3 inContext:(CGContext *)a4 withTotalScale:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (-[TSDFrame i_willRenderForRect:](self->mFrame, "i_willRenderForRect:"))
  {
    -[TSDFrame coverageRectWithoutAdornment:](self->mFrame, "coverageRectWithoutAdornment:", x, y, width, height);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    CGContextSaveGState(a4);
    if (self->mImages)
    {
      v20 = -[TSDFrameRep p_newFrameForMask:size:forCALayer:viewScale:](self, "p_newFrameForMask:size:forCALayer:viewScale:", 0, 0, v17, v19, fmax(a5, 1.0));
      if (v20)
      {
        v21 = v20;
        v30.origin.double x = v13;
        v30.origin.double y = v15;
        v30.size.double width = v17;
        v30.size.double height = v19;
        CGContextDrawImage(a4, v30, v20);
        CGImageRelease(v21);
      }
      else
      {
        -[TSDFrameRep p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:](self, "p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:", a4, self->mImages, 0, v13, v15, v17, v19, 1.0);
      }
    }
    if (self->mAdornment)
    {
      -[TSDFrame i_adornmentRectForRect:](self->mFrame, "i_adornmentRectForRect:", v13, v15, v17, v19);
      CGFloat v22 = v31.origin.x;
      CGFloat v23 = v31.origin.y;
      double v24 = v31.size.width;
      double v25 = v31.size.height;
      CGFloat MaxY = CGRectGetMaxY(v31);
      CGContextTranslateCTM(a4, 0.0, MaxY);
      CGContextScaleCTM(a4, 1.0, -1.0);
      v32.origin.double x = v22;
      v32.origin.double y = v23;
      v32.size.double width = v24;
      v32.size.double height = v25;
      CGFloat MinY = CGRectGetMinY(v32);
      CGContextTranslateCTM(a4, 0.0, -MinY);
      v28 = -[TSDBitmapImageProvider CGImageForSize:inContext:orLayer:](self->mAdornment, "CGImageForSize:inContext:orLayer:", a4, 0, v24, v25);
      v33.origin.double x = v22;
      v33.origin.double y = v23;
      v33.size.double width = v24;
      v33.size.double height = v25;
      CGContextDrawImage(a4, v33, v28);
    }
    CGContextRestoreGState(a4);
  }
}

- (void)applyMaskForRectWithCoverage:(CGRect)a3 toContext:(CGContext *)a4
{
  if (self->mMasks)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    if (-[TSDFrame shouldRenderForSizeIncludingCoverage:](self->mFrame, "shouldRenderForSizeIncludingCoverage:", a3.size.width, a3.size.height))
    {
      v10 = -[TSDFrameRep p_newFrameForMask:size:forCALayer:viewScale:](self, "p_newFrameForMask:size:forCALayer:viewScale:", 1, 0, width, height, TSDCGContextAssociatedScreenScale((uint64_t)a4));
      if (v10)
      {
        uint64_t v11 = v10;
        v13.origin.double x = x;
        v13.origin.double y = y;
        v13.size.double width = width;
        v13.size.double height = height;
        CGContextClipToMask(a4, v13, v10);
        CGImageRelease(v11);
      }
      else
      {
        -[TSDFrameRep p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:](self, "p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:", a4, self->mMasks, 1, x, y, width, height, 1.0);
        self->mShouldEnableBlendMode = 1;
      }
    }
  }
}

- (void)blendMaskBeforeRenderingImageInContext:(CGContext *)a3
{
  if (self->mShouldEnableBlendMode)
  {
    self->mShouldEnableBlendMode = 0;
    CGContextSetBlendMode(a3, kCGBlendModeSourceIn);
  }
}

- (id)applyToCALayer:(id)a3 withRepLayer:(id)a4 maskLayer:(id)a5 viewScale:(double)a6
{
  if (![(TSDFrame *)self->mFrame shouldRender]) {
    return 0;
  }
  [a3 contentsScale];
  double v10 = v9;
  [a3 setSublayers:0];
  if (self->mImages)
  {
    mMasks = self->mMasks;
    if (mMasks)
    {
      if (!a5)
      {
        double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[TSDFrameRep applyToCALayer:withRepLayer:maskLayer:viewScale:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 223, @"invalid nil value for '%s'", "repMaskLayer");
      }
      if (self->mMaskLayer)
      {
        int v14 = objc_msgSend((id)objc_msgSend(a5, "sublayers"), "containsObject:", self->mMaskLayer);
        mMaskLayer = self->mMaskLayer;
        if (v14)
        {
          [(CALayer *)mMaskLayer removeFromSuperlayer];
          mMaskLayer = self->mMaskLayer;
        }
      }
      else
      {
        mMaskLayer = 0;
      }

      self->mMaskLayer = 0;
      double v18 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      self->mMaskLayer = v18;
      [(CALayer *)v18 setContentsScale:v10];
      [a5 addSublayer:self->mMaskLayer];
    }
    else
    {
      double v17 = self->mMaskLayer;
      if (v17)
      {
        [(CALayer *)v17 removeFromSuperlayer];

        self->mMaskLayer = 0;
      }
    }
    uint64_t v19 = 0;
    do
    {
      [(TSDFrameRep *)self p_addUnreplicatedLayerForIndex:v19 toLayer:a3 maskLayer:self->mMaskLayer];
      [(TSDFrameRep *)self p_addEdgeLayerForIndex:(v19 + 1) toLayer:a3 maskLayer:self->mMaskLayer];
      BOOL v20 = v19 >= 5;
      uint64_t v19 = (v19 + 2);
    }
    while (!v20);
    if (mMasks)
    {
      v21 = (void *)[MEMORY[0x263F157E8] layer];
      DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
      [v21 setBackgroundColor:DeviceRGB];
      CGColorRelease(DeviceRGB);
      [v21 setEdgeAntialiasingMask:0];
      [(CALayer *)self->mMaskLayer addSublayer:v21];
    }
  }
  if (self->mAdornment)
  {
    CGFloat v23 = (void *)[MEMORY[0x263F157E8] layer];
    [v23 setContentsScale:v10];
    objc_msgSend(v23, "setContents:", -[TSDBitmapImageProvider CGImageForNaturalSize](self->mAdornment, "CGImageForNaturalSize"));
    [a3 addSublayer:v23];
  }
  return self->mMaskLayer;
}

- (void)updateCALayer:(id)a3 toRect:(CGRect)a4 withRepLayer:(id)a5 maskLayer:(id)a6 viewScale:(double)a7 maskLayerTransform:(CGAffineTransform *)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (a8->a == 0.0 && a8->b == 0.0 || a8->c == 0.0 && a8->d == 0.0)
  {
    double v17 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a5);
    uint64_t v18 = [NSString stringWithUTF8String:"-[TSDFrameRep updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:]"];
    uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"];
    long long v20 = *(_OWORD *)&a8->c;
    *(_OWORD *)&transform.a = *(_OWORD *)&a8->a;
    *(_OWORD *)&transform.c = v20;
    *(_OWORD *)&transform.tdouble x = *(_OWORD *)&a8->tx;
    [v17 handleFailureInFunction:v18, v19, 270, @"bad maskLayerTransform: %@", NSStringFromCGAffineTransform(&transform) file lineNumber description];
  }
  if ([(TSDFrame *)self->mFrame shouldRender])
  {
    mFrame = self->mFrame;
    -[TSDFrame coverageRectWithoutAdornment:](mFrame, "coverageRectWithoutAdornment:", x, y, width, height);
    if (-[TSDFrame shouldRenderForSizeIncludingCoverage:](mFrame, "shouldRenderForSizeIncludingCoverage:", v22, v23))
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      double v24 = (void *)[a3 sublayers];
      mMasks = self->mMasks;
      if (mMasks)
      {
        if (!self->mMaskLayer)
        {
          v26 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v27 = [NSString stringWithUTF8String:"-[TSDFrameRep updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:]"];
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 284, @"invalid nil value for '%s'", "mMaskLayer");
        }
        if ((objc_msgSend((id)objc_msgSend(a6, "sublayers"), "containsObject:", self->mMaskLayer) & 1) == 0)
        {
          v28 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v29 = [NSString stringWithUTF8String:"-[TSDFrameRep updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:]"];
          objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 285, @"TSDFrameRep's mask layer is not a sublayer of the mask layer passed in");
        }
      }
      uint64_t v30 = -[TSDFrame i_willRenderForRect:](self->mFrame, "i_willRenderForRect:", x, y, width, height) ^ 1;
      if (v30)
      {
        [a3 bounds];
        double v42 = v41;
        double v44 = v43;
        uint64_t DeviceRGB = TSUCGColorCreateDeviceRGB();
        v46 = (CGColor *)DeviceRGB;
        if ([a3 isHidden])
        {
LABEL_19:
          mMaskLayer = self->mMaskLayer;
          if (mMaskLayer)
          {
            if (!CGColorEqualToColor([(CALayer *)mMaskLayer backgroundColor], v46)) {
              [(CALayer *)self->mMaskLayer setBackgroundColor:v46];
            }
            double v48 = TSDRectWithSize();
            double v50 = v49;
            double v52 = v51;
            double v54 = v53;
            [(CALayer *)self->mMaskLayer bounds];
            v164.origin.double x = v55;
            v164.origin.double y = v56;
            v164.size.double width = v57;
            v164.size.double height = v58;
            v160.origin.double x = v48;
            v160.origin.double y = v50;
            v160.size.double width = v52;
            v160.size.double height = v54;
            if (!CGRectEqualToRect(v160, v164)) {
              -[CALayer setBounds:](self->mMaskLayer, "setBounds:", v48, v50, v52, v54);
            }
            double v59 = -v42 / v52;
            double v60 = -v44 / v54;
            [(CALayer *)self->mMaskLayer anchorPoint];
            if (v59 != v62 || v60 != v61) {
              -[CALayer setAnchorPoint:](self->mMaskLayer, "setAnchorPoint:", v59, v60);
            }
            double v64 = *MEMORY[0x263F00148];
            double v65 = *(double *)(MEMORY[0x263F00148] + 8);
            [(CALayer *)self->mMaskLayer position];
            if (v64 != v67 || v65 != v66) {
              -[CALayer setPosition:](self->mMaskLayer, "setPosition:", v64, v65);
            }
            v68 = self->mMaskLayer;
            if (v68) {
              [(CALayer *)v68 affineTransform];
            }
            else {
              memset(&t2, 0, sizeof(t2));
            }
            long long v69 = *(_OWORD *)&a8->c;
            *(_OWORD *)&transform.a = *(_OWORD *)&a8->a;
            *(_OWORD *)&transform.c = v69;
            *(_OWORD *)&transform.tdouble x = *(_OWORD *)&a8->tx;
            if (!CGAffineTransformEqualToTransform(&transform, &t2))
            {
              long long v70 = *(_OWORD *)&a8->c;
              v157[0] = *(_OWORD *)&a8->a;
              v157[1] = v70;
              v157[2] = *(_OWORD *)&a8->tx;
              [(CALayer *)self->mMaskLayer setAffineTransform:v157];
            }
          }
          CGColorRelease(v46);
          [MEMORY[0x263F158F8] commit];
          return;
        }
LABEL_18:
        [a3 setHidden:v30];
        v46 = (CGColor *)DeviceRGB;
        goto LABEL_19;
      }
      double v155 = *MEMORY[0x263F001A8];
      double v156 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v153 = x;
      -[TSDFrame coverageRectWithoutAdornment:](self->mFrame, "coverageRectWithoutAdornment:", x, y, width, height);
      double v32 = v31;
      double v151 = v34;
      double v152 = v33;
      double v154 = v35;
      double v36 = TSDMultiplyRectScalar(v33, v34, v31, v35, a7);
      if (!self->mImages) {
        goto LABEL_64;
      }
      if (mMasks)
      {
        double v38 = v36;
        double v39 = v37;
        v40 = [(CALayer *)self->mMaskLayer sublayers];
        double v156 = v39;
        double v155 = v38;
      }
      else
      {
        v40 = 0;
      }
      [(TSDFrame *)self->mFrame i_leftWidth];
      double v72 = v71;
      [(TSDFrame *)self->mFrame i_rightWidth];
      double v74 = v32 - v73;
      [(TSDFrame *)self->mFrame i_topHeight];
      double v76 = v75;
      [(TSDFrame *)self->mFrame i_bottomHeight];
      double v78 = v72 * a7;
      double v79 = v76 * a7;
      double v80 = (v154 - v77) * a7;
      if (v78 == v74 * a7) {
        double v81 = v78 + 1.0;
      }
      else {
        double v81 = v74 * a7;
      }
      if (v79 == v80) {
        double v80 = v79 + 1.0;
      }
      double v150 = v80;
      if ([(TSDFrameSpec *)[(TSDFrame *)self->mFrame frameSpec] i_tilingMode] == 2)
      {
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 0, v24, v40, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v78, v79);
        double v82 = v81 - v78;
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 1, v24, v40, v78, 0.0, v81 - v78, v79);
        [(TSDFrame *)self->mFrame i_rightWidth];
        double v84 = v83 * a7;
        [(TSDFrame *)self->mFrame i_topHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 2, v24, v40, v81, 0.0, v84, v85 * a7);
        [(TSDFrame *)self->mFrame i_rightWidth];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 3, v24, v40, v81, v79, v86 * a7, v150 - v79);
        [(TSDFrame *)self->mFrame i_rightWidth];
        double v88 = v87 * a7;
        [(TSDFrame *)self->mFrame i_bottomHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 4, v24, v40, v81, v150, v88, v89 * a7);
        [(TSDFrame *)self->mFrame i_bottomHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 5, v24, v40, v78, v150, v81 - v78, v90 * a7);
        [(TSDFrame *)self->mFrame i_leftWidth];
        double v92 = v91 * a7;
        [(TSDFrame *)self->mFrame i_bottomHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 6, v24, v40, 0.0, v150, v92, v93 * a7);
        [(TSDFrame *)self->mFrame i_leftWidth];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 7, v24, v40, 0.0, v79, v94 * a7, v150 - v79);
        if (mMasks)
        {
          id v95 = [(NSArray *)v40 objectAtIndex:8];
          CGFloat v96 = -1.0;
          CGFloat v97 = -1.0;
          double v98 = v78;
          double v99 = v79;
          double v100 = v82;
          double v101 = v150 - v79;
          goto LABEL_62;
        }
      }
      else
      {
        [(TSDFrame *)self->mFrame assetScale];
        double v103 = v102;
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 0, v24, v40, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v78, v79);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 1), "dpiAdjustedFillSize");
        if (v104 <= 1.0) {
          double v105 = 1.0;
        }
        else {
          double v105 = v103;
        }
        double v106 = v104 * v105 * a7;
        [(TSDFrame *)self->mFrame i_topHeight];
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 1, v24, v40, v78, 0.0, v106, v107 * a7, v78, v81);
        [(TSDFrame *)self->mFrame i_rightWidth];
        double v109 = v108 * a7;
        [(TSDFrame *)self->mFrame i_topHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 2, v24, v40, v81, 0.0, v109, v110 * a7);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 3), "dpiAdjustedFillSize");
        if (v111 <= 1.0) {
          double v112 = 1.0;
        }
        else {
          double v112 = v103;
        }
        double v113 = v111 * v112;
        [(TSDFrame *)self->mFrame i_rightWidth];
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 3, v24, v40, v81, v79, v114 * a7, v113 * a7, v79, v150);
        [(TSDFrame *)self->mFrame i_rightWidth];
        double v116 = v115 * a7;
        [(TSDFrame *)self->mFrame i_bottomHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 4, v24, v40, v81, v150, v116, v117 * a7);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 5), "dpiAdjustedFillSize");
        if (v118 <= 1.0) {
          double v119 = 1.0;
        }
        else {
          double v119 = v103;
        }
        double v120 = v118 * v119 * a7 + 1.0;
        [(TSDFrame *)self->mFrame i_bottomHeight];
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 5, v24, v40, v78, v150, v120, v121 * a7, v78, v81);
        [(TSDFrame *)self->mFrame i_leftWidth];
        double v123 = v122 * a7;
        [(TSDFrame *)self->mFrame i_bottomHeight];
        -[TSDFrameRep p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:](self, "p_setUnreplicatedLayerWithIndex:sublayers:maskLayers:toRect:", 6, v24, v40, 0.0, v150, v123, v124 * a7);
        objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", 7), "dpiAdjustedFillSize");
        if (v125 <= 1.0) {
          double v126 = 1.0;
        }
        else {
          double v126 = v103;
        }
        double v127 = v125 * v126;
        [(TSDFrame *)self->mFrame i_leftWidth];
        -[TSDFrameRep p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:](self, "p_setRepeatingLayerWithIndex:sublayers:maskLayers:toRect:start:end:", 7, v24, v40, 0.0, v79, v128 * a7, v127 * a7, v79, v150);
        if (mMasks)
        {
          id v95 = [(NSArray *)v40 objectAtIndex:8];
          double v100 = v81 - v78;
          double v101 = v150 - v79;
          CGFloat v96 = -1.0;
          CGFloat v97 = -1.0;
          double v98 = v78;
          double v99 = v79;
LABEL_62:
          CGRect v161 = CGRectInset(*(CGRect *)&v98, v96, v97);
          CGRect v162 = CGRectIntegral(v161);
          double v129 = v162.origin.x;
          double v130 = v162.origin.y;
          double v131 = v162.size.width;
          double v132 = v162.size.height;
          [v95 frame];
          v165.origin.double x = v129;
          v165.origin.double y = v130;
          v165.size.double width = v131;
          v165.size.double height = v132;
          if (!CGRectEqualToRect(v163, v165)) {
            objc_msgSend(v95, "setFrame:", v129, v130, v131, v132);
          }
LABEL_64:
          double v42 = v155;
          goto LABEL_66;
        }
      }
      double v42 = v155;
LABEL_66:
      if (self->mAdornment)
      {
        -[TSDFrame i_adornmentRectForRect:](self->mFrame, "i_adornmentRectForRect:", v152, v151, v32, v154);
        double v134 = v133;
        double v135 = v42;
        double v137 = v136;
        CGFloat v139 = v138;
        CGFloat v141 = v140;
        double v142 = TSDSubtractPoints(v153, y, v152);
        double v143 = v137;
        double v42 = v135;
        double v144 = TSDAddPoints(v134, v143, v142);
        double v146 = TSDMultiplyRectScalar(v144, v145, v139, v141, a7);
        objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 8 * (self->mImages != 0)), "setFrame:", v146, v147, v148, v149);
      }
      uint64_t DeviceRGB = 0;
      v46 = 0;
      double v44 = v156;
      if ((objc_msgSend(a3, "isHidden", v36) & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
}

- (CGImage)p_newFrameForMask:(BOOL)a3 size:(CGSize)a4 forCALayer:(BOOL)a5 viewScale:(double)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  BOOL v10 = a3;
  id v12 = +[TSDFrameImageCache sharedFrameImageCache];
  result = (CGImage *)objc_msgSend(v12, "newCachedImageForFrame:size:viewScale:forCALayer:mask:", self->mFrame, v7, v10, width, height, a6);
  if (!result)
  {
    result = -[TSDFrameRep p_newRenderedFrameForMask:size:forCALayer:viewScale:](self, "p_newRenderedFrameForMask:size:forCALayer:viewScale:", v10, v7, width, height, a6);
    if (result)
    {
      int v14 = result;
      double v15 = (CGImage *)objc_msgSend(v12, "setCachedImage:forFrame:size:viewScale:forCALayer:mask:", result, self->mFrame, v7, v10, width, height, a6);
      CGImageRelease(v14);
      return v15;
    }
  }
  return result;
}

- (CGImage)p_newRenderedFrameForMask:(BOOL)a3 size:(CGSize)a4 forCALayer:(BOOL)a5 viewScale:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (TSDMultiplySizeScalar(a4.width, a4.height, a6) >= 4096.0 || v10 >= 4096.0) {
    return 0;
  }
  TSURound();
  size_t v14 = (unint64_t)v13;
  TSURound();
  size_t v16 = (unint64_t)v15;
  uint64_t v17 = 16;
  if (v8) {
    uint64_t v17 = 24;
  }
  uint64_t v18 = *(uint64_t *)((char *)&self->super.isa + v17);
  if (v8)
  {
    size_t AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
    long long v20 = (CGColorSpace *)TSUDeviceGrayColorSpace();
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], AlignedBytesPerRow * v16);
    CFDataSetLength(Mutable, AlignedBytesPerRow * v16);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint32_t v23 = 0;
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    mImages = self->mImages;
    uint64_t v25 = [(NSArray *)mImages countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(mImages);
          }
          if ((unint64_t)[*(id *)(*((void *)&v39 + 1) + 8 * i) imageGamut] < 2)
          {
            size_t AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
            long long v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
            MutableBytePtr = 0;
            Mutable = 0;
            uint32_t v23 = 8193;
            goto LABEL_20;
          }
        }
        uint64_t v26 = [(NSArray *)mImages countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
    size_t AlignedBytesPerRow = TSUBitmapGetAlignedBytesPerRow();
    uint32_t v23 = 8193;
    long long v20 = (CGColorSpace *)TSUDeviceRGBColorSpace();
    MutableBytePtr = 0;
    Mutable = 0;
  }
LABEL_20:
  uint64_t v29 = CGBitmapContextCreate(MutableBytePtr, v14, v16, 8uLL, AlignedBytesPerRow, v20, v23);
  if (v29)
  {
    uint64_t v30 = v29;
    if (v7)
    {
      CGContextTranslateCTM(v29, 0.0, (double)v16);
      CGContextScaleCTM(v30, 1.0, -1.0);
    }
    if (v8)
    {
      CGContextSetGrayFillColor(v30, 1.0, 1.0);
      double v31 = (double)v14;
      double v32 = (double)v16;
      v45.origin.double x = 0.0;
      v45.origin.double y = 0.0;
      v45.size.double width = (double)v14;
      v45.size.double height = (double)v16;
      CGContextFillRect(v30, v45);
    }
    else
    {
      double v32 = (double)v16;
      double v31 = (double)v14;
    }
    -[TSDFrameRep p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:](self, "p_drawFrameIntoRect:inContext:withImages:atViewScale:isMask:", v30, v18, v8, 0.0, 0.0, v31 / a6, v32 / a6, a6);
    if (v8)
    {
      CGContextRelease(v30);
      double v33 = CGDataProviderCreateWithCFData(Mutable);
      id v12 = CGImageMaskCreate(v14, v16, 8uLL, 8uLL, AlignedBytesPerRow, v33, 0, 1);
      CGDataProviderRelease(v33);
      if (v7)
      {
        CGFloat v34 = TSDBitmapContextCreate(3, v31);
        CGFloat v35 = *MEMORY[0x263F00148];
        CGFloat v36 = *(double *)(MEMORY[0x263F00148] + 8);
        v46.origin.double x = *(CGFloat *)MEMORY[0x263F00148];
        v46.origin.double y = v36;
        v46.size.double width = v31;
        v46.size.double height = v32;
        CGContextClipToMask(v34, v46, v12);
        CGContextSetRGBFillColor(v34, 1.0, 1.0, 1.0, 1.0);
        v47.origin.double x = v35;
        v47.origin.double y = v36;
        v47.size.double width = v31;
        v47.size.double height = v32;
        CGContextFillRect(v34, v47);
        CGImageRef Image = CGBitmapContextCreateImage(v34);
        CGContextRelease(v34);
        CGImageRelease(v12);
        id v12 = Image;
      }
    }
    else
    {
      id v12 = CGBitmapContextCreateImage(v30);
      CGContextRelease(v30);
    }
  }
  else
  {
    id v12 = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v12;
}

- (void)p_drawFrameIntoRect:(CGRect)a3 inContext:(CGContext *)a4 withImages:(id)a5 atViewScale:(double)a6 isMask:(BOOL)a7
{
  BOOL v7 = a7;
  v51.origin.CGFloat x = TSDRoundedRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  CGFloat width = v51.size.width;
  CGFloat height = v51.size.height;
  double MinX = CGRectGetMinX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  CGRectGetMaxX(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v53);
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  CGRectGetMaxY(v54);
  [(TSDFrame *)self->mFrame i_leftWidth];
  TSURound();
  double v47 = v16;
  [(TSDFrame *)self->mFrame i_topHeight];
  TSURound();
  double v48 = v17;
  [(TSDFrame *)self->mFrame i_rightWidth];
  TSURound();
  [(TSDFrame *)self->mFrame i_bottomHeight];
  TSURound();
  [(TSDFrame *)self->mFrame i_leftWidth];
  [(TSDFrame *)self->mFrame i_rightWidth];
  [(TSDFrame *)self->mFrame i_topHeight];
  [(TSDFrame *)self->mFrame i_bottomHeight];
  TSURound();
  double v19 = v18;
  TSURound();
  double v21 = v20;
  TSURound();
  double v23 = v22;
  TSURound();
  double v25 = v19 + 1.0;
  if (v19 != v21) {
    double v25 = v21;
  }
  double v45 = v25;
  double v46 = v19;
  if (v23 == v24) {
    double v26 = v23 + 1.0;
  }
  else {
    double v26 = v24;
  }
  [(TSDFrame *)self->mFrame assetScale];
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 0), "drawImageInContext:rect:", a4, MinX, MinY, v47, v48);
  double v27 = TSDRoundedSize();
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 6), "drawImageInContext:rect:", a4, MinX, v26, v27, v28);
  double v29 = TSDRoundedSize();
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 2), "drawImageInContext:rect:", a4, v45, MinY, v29, v30);
  double v31 = TSDRoundedSize();
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 4), "drawImageInContext:rect:", a4, v45, v26, v31, v32);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 7), "dpiAdjustedFillSize");
  double v33 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", [a5 objectAtIndex:7], a4, 1, MinX, v23, v33, v34, v23, v26);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 3), "dpiAdjustedFillSize");
  double v35 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", [a5 objectAtIndex:3], a4, 1, v45, v23, v35, v36, v23, v26);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 1), "dpiAdjustedFillSize");
  double v37 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", [a5 objectAtIndex:1], a4, 0, v46, MinY, v37, v38, v46, v45);
  objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", 5), "dpiAdjustedFillSize");
  double v39 = TSDRoundedSize();
  -[TSDFrameRep p_drawTiles:inContext:rect:start:end:vertical:](self, "p_drawTiles:inContext:rect:start:end:vertical:", [a5 objectAtIndex:5], a4, 0, v46, v26, v39, v40, v46, v45);
  if (v7)
  {
    CGContextSetGrayFillColor(a4, 0.0, 1.0);
    double v43 = v46;
    double v44 = v23;
    double v41 = v45 - v46;
    double v42 = v26 - v23;
    CGContextFillRect(a4, *(CGRect *)&v43);
  }
}

- (void)p_drawTiles:(id)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 start:(double)a6 end:(double)a7 vertical:(BOOL)a8
{
  BOOL v8 = a8;
  CGRect v34 = CGRectIntegral(a5);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  if (!CGRectIsEmpty(v34))
  {
    double v18 = a7 - a6;
    if (v8) {
      double v19 = width;
    }
    else {
      double v19 = a7 - a6;
    }
    if (v8) {
      double v20 = a7 - a6;
    }
    else {
      double v20 = height;
    }
    if ([(TSDFrameSpec *)[(TSDFrame *)self->mFrame frameSpec] i_tilingMode] == 2)
    {
      objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, v19, v20);
    }
    else
    {
      if (v8) {
        double v21 = height;
      }
      else {
        double v21 = width;
      }
      float v22 = v18 / v21;
      int v23 = vcvtps_s32_f32(v22);
      if ([(TSDFrameSpec *)[(TSDFrame *)self->mFrame frameSpec] i_tilingMode] == 1)
      {
        if (v23 >= 1)
        {
          double v24 = v18 / (double)v23;
          do
          {
            a6 = v24 + a6;
            TSURound();
            double v26 = v25;
            double v27 = x;
            double v28 = y;
            double v29 = width;
            double v30 = height;
            if (v8)
            {
              double height = v26 - CGRectGetMinY(*(CGRect *)&v27);
              objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, width, height);
              v35.origin.double x = x;
              v35.origin.double y = y;
              v35.size.double width = width;
              v35.size.double height = height;
              double y = CGRectGetMaxY(v35);
            }
            else
            {
              double width = v26 - CGRectGetMinX(*(CGRect *)&v27);
              objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, width, height);
              v36.origin.double x = x;
              v36.origin.double y = y;
              v36.size.double width = width;
              v36.size.double height = height;
              double x = CGRectGetMaxX(v36);
            }
            --v23;
          }
          while (v23);
        }
      }
      else
      {
        CGContextSaveGState(a4);
        v37.origin.double x = x;
        v37.origin.double y = y;
        v37.size.double width = v19;
        v37.size.double height = v20;
        CGContextClipToRect(a4, v37);
        if (v23 >= 1)
        {
          if (v8) {
            double v31 = -0.0;
          }
          else {
            double v31 = width;
          }
          if (v8) {
            double v32 = height;
          }
          else {
            double v32 = -0.0;
          }
          do
          {
            objc_msgSend(a3, "drawImageInContext:rect:", a4, x, y, width, height);
            double x = v31 + x;
            double y = v32 + y;
            --v23;
          }
          while (v23);
        }
        CGContextRestoreGState(a4);
      }
    }
  }
}

- (void)p_addUnreplicatedLayerForIndex:(unsigned int)a3 toLayer:(id)a4 maskLayer:(id)a5
{
  uint64_t v8 = p_addUnreplicatedLayerForIndex_toLayer_maskLayer__edgeAAMasks[a3];
  uint64_t v9 = a3;
  [a4 contentsScale];
  double v11 = v10;
  id v12 = (void *)[MEMORY[0x263F157E8] layer];
  double v13 = (CGImage *)objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", v9), "CGImageForNaturalSize");
  [v12 setContents:v13];
  size_t Width = CGImageGetWidth(v13);
  size_t Height = CGImageGetHeight(v13);
  if (Width > 0x7FF || Height >= 0x800)
  {
    double v16 = (double)Height;
    double v17 = (double)Width;
    double v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSDFrameRep p_addUnreplicatedLayerForIndex:toLayer:maskLayer:]"];
    [v18 handleFailureInFunction:v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 937, @"frame image is too big for %@ (%f, %f)", -[TSDFrame frameName](self->mFrame, "frameName"), *(void *)&v17, *(void *)&v16 file lineNumber description];
  }
  [v12 setEdgeAntialiasingMask:v8];
  [v12 setContentsScale:v11];
  [a4 addSublayer:v12];
  if (a5)
  {
    double v20 = (void *)[MEMORY[0x263F157E8] layer];
    objc_msgSend(v20, "setContents:", objc_msgSend(-[NSArray objectAtIndex:](self->mMasks, "objectAtIndex:", v9), "CGImageForNaturalSize"));
    [v20 setContentsScale:v11];
    [v20 setEdgeAntialiasingMask:v8];
    [a5 addSublayer:v20];
  }
}

- (void)p_addEdgeLayerForIndex:(unsigned int)a3 toLayer:(id)a4 maskLayer:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  if ([(TSDFrameSpec *)[(TSDFrame *)self->mFrame frameSpec] i_tilingMode] == 2)
  {
    [(TSDFrameRep *)self p_addUnreplicatedLayerForIndex:v7 toLayer:a4 maskLayer:a5];
  }
  else
  {
    int v9 = v7 & 0xFFFFFFFB;
    uint64_t v10 = objc_msgSend(-[NSArray objectAtIndex:](self->mImages, "objectAtIndex:", v7), "CGImageForNaturalSize");
    [a4 contentsScale];
    objc_msgSend(a4, "addSublayer:", -[TSDFrameRep p_createRepeatingLayerWithImage:vertical:screenScale:](self, "p_createRepeatingLayerWithImage:vertical:screenScale:", v10, (v7 & 0xFFFFFFFB) == 3));
    if (a5)
    {
      uint64_t v11 = objc_msgSend(-[NSArray objectAtIndex:](self->mMasks, "objectAtIndex:", v7), "CGImageForNaturalSize");
      [a4 contentsScale];
      id v12 = -[TSDFrameRep p_createRepeatingLayerWithImage:vertical:screenScale:](self, "p_createRepeatingLayerWithImage:vertical:screenScale:", v11, v9 == 3);
      [a5 addSublayer:v12];
    }
  }
}

- (id)p_createRepeatingLayerWithImage:(CGImage *)a3 vertical:(BOOL)a4 screenScale:(double)a5
{
  BOOL v6 = a4;
  int v9 = (void *)[MEMORY[0x263F15908] layer];
  uint64_t v10 = (void *)[MEMORY[0x263F157E8] layer];
  objc_msgSend(v10, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [v10 setContentsScale:a5];
  [v9 addSublayer:v10];
  [v10 setContents:a3];
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  if (Width > 0x7FF || Height >= 0x800)
  {
    double v13 = (double)Height;
    double v14 = (double)Width;
    double v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSDFrameRep p_createRepeatingLayerWithImage:vertical:screenScale:]"];
    [v15 handleFailureInFunction:v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 994, @"frame image is too big for %@ (%f, %f)", -[TSDFrame frameName](self->mFrame, "frameName"), *(void *)&v14, *(void *)&v13 file lineNumber description];
  }
  if (v6) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 12;
  }
  [v10 setEdgeAntialiasingMask:v17];
  return v9;
}

- (void)p_setUnreplicatedLayerWithIndex:(unsigned int)a3 sublayers:(id)a4 maskLayers:(id)a5 toRect:(CGRect)a6
{
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v9 = fmax(a6.size.width, 1.0);
  double v10 = fmax(a6.size.height, 1.0);
  uint64_t v11 = a3;
  id v12 = (void *)[a4 objectAtIndex:a3];
  [v12 frame];
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = v9;
  v17.size.double height = v10;
  if (!CGRectEqualToRect(v15, v17)) {
    objc_msgSend(v12, "setFrame:", x, y, v9, v10);
  }
  if (a5)
  {
    double v13 = (void *)[a5 objectAtIndex:v11];
    [v13 frame];
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = v9;
    v18.size.double height = v10;
    if (!CGRectEqualToRect(v16, v18))
    {
      objc_msgSend(v13, "setFrame:", x, y, v9, v10);
    }
  }
}

- (void)p_setRepeatingLayerWithIndex:(unsigned int)a3 sublayers:(id)a4 maskLayers:(id)a5 toRect:(CGRect)a6 start:(double)a7 end:(double)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  unsigned int v16 = a3 & 0xFFFFFFFB;
  uint64_t v17 = a3;
  -[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:](self, "p_adjustRepeatingLayer:withImageRect:start:end:vertical:", [a4 objectAtIndex:a3], (a3 & 0xFFFFFFFB) == 3, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7, a8);
  if (a5)
  {
    uint64_t v18 = [a5 objectAtIndex:v17];
    -[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:](self, "p_adjustRepeatingLayer:withImageRect:start:end:vertical:", v18, v16 == 3, x, y, width, height, a7, a8);
  }
}

- (void)p_adjustRepeatingLayer:(id)a3 withImageRect:(CGRect)a4 start:(double)a5 end:(double)a6 vertical:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double y = a4.origin.y;
  uint64_t v87 = *MEMORY[0x263EF8340];
  double v14 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "objectAtIndex:", 0);
  unint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "count");
  [v14 bounds];
  CGFloat v70 = v17;
  CGFloat v71 = v16;
  CGFloat v68 = v19;
  CGFloat v69 = v18;
  [a3 contentsScale];
  double v21 = v20;
  double v22 = a6 - a5;
  if (v7) {
    double v23 = height;
  }
  else {
    double v23 = width;
  }
  if (v7) {
    double v24 = a6 - a5;
  }
  else {
    double v24 = height;
  }
  double v74 = v24;
  if (v7) {
    double v25 = width;
  }
  else {
    double v25 = a6 - a5;
  }
  float v26 = v22 / v23;
  unint64_t v27 = vcvtps_u32_f32(v26);
  if (!v27)
  {
    double v28 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v29 = [NSString stringWithUTF8String:"-[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:]"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 1070, @"Need at least one tile for a frame");
  }
  if (v15 <= v27)
  {
    if (v15 < v27)
    {
      if (v7) {
        uint64_t v31 = 3;
      }
      else {
        uint64_t v31 = 12;
      }
      uint64_t v32 = [v14 contents];
      double v33 = *MEMORY[0x263F00148];
      double v34 = *(double *)(MEMORY[0x263F00148] + 8);
      unint64_t v35 = v27 - v15;
      do
      {
        CGRect v36 = (void *)[MEMORY[0x263F157E8] layer];
        objc_msgSend(v36, "setAnchorPoint:", v33, v34);
        [v36 setContentsScale:v21];
        [a3 addSublayer:v36];
        [v36 setContents:v32];
        [v36 setEdgeAntialiasingMask:v31];
        --v35;
      }
      while (v35);
    }
  }
  else
  {
    double v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend(a3, "sublayers"));
    objc_msgSend(v30, "removeObjectsInRange:", v27, v15 - v27);
    [a3 setSublayers:v30];
  }
  if (objc_msgSend((id)objc_msgSend(a3, "sublayers"), "count") != v27)
  {
    CGRect v37 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v38 = [NSString stringWithUTF8String:"-[TSDFrameRep p_adjustRepeatingLayer:withImageRect:start:end:vertical:]"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameRep.m"), 1093, @"Wrong number of layers: %li when expected %li", objc_msgSend((id)objc_msgSend(a3, "sublayers"), "count"), v27);
  }
  double v72 = (double)v27;
  double v73 = v25;
  if ([(TSDFrameSpec *)[(TSDFrame *)self->mFrame frameSpec] i_tilingMode] == 1) {
    double v23 = v22 / (double)v27;
  }
  double v39 = TSDRectWithSize();
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v88.origin.double y = v70;
  v88.origin.double x = v71;
  v88.size.double height = v68;
  v88.size.double width = v69;
  v90.origin.double x = v39;
  v90.origin.double y = v41;
  v90.size.double width = v43;
  v90.size.double height = v45;
  if (!CGRectEqualToRect(v88, v90))
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    double v46 = (void *)[a3 sublayers];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v81 objects:v86 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v82 != v49) {
            objc_enumerationMutation(v46);
          }
          objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * i), "setBounds:", v39, v41, v43, v45);
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v81 objects:v86 count:16];
      }
      while (v48);
    }
  }
  if (v7) {
    double v51 = 0.0;
  }
  else {
    double v51 = v23;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  if (v7) {
    double v52 = v23;
  }
  else {
    double v52 = 0.0;
  }
  long long v77 = 0uLL;
  long long v78 = 0uLL;
  CGRect v53 = (void *)[a3 sublayers];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    int v56 = 0;
    uint64_t v57 = *(void *)v78;
    if (v7) {
      double v58 = width;
    }
    else {
      double v58 = v23;
    }
    if (v7) {
      double v59 = v23;
    }
    else {
      double v59 = height;
    }
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v78 != v57) {
          objc_enumerationMutation(v53);
        }
        double v61 = *(void **)(*((void *)&v77 + 1) + 8 * j);
        objc_msgSend(v61, "setBounds:", 0.0, 0.0, v58, v59);
        objc_msgSend(v61, "setPosition:", v51 * (double)(v56 + j), v52 * (double)(v56 + j));
        objc_msgSend(v61, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v77 objects:v85 count:16];
      v56 += j;
    }
    while (v55);
  }
  double v62 = objc_msgSend((id)objc_msgSend(a3, "sublayers"), "lastObject");
  double v63 = v23 * v72;
  if (v23 * v72 > v22)
  {
    double v64 = v62;
    double v65 = -(v22 - v72 * v23);
    if (v7) {
      double v66 = 1.0;
    }
    else {
      double v66 = 1.0 - v65 / v23;
    }
    if (v7) {
      double v67 = 1.0 - v65 / v23;
    }
    else {
      double v67 = 1.0;
    }
    objc_msgSend(v62, "setContentsRect:", 0.0, 0.0, v66, v67);
    [v64 bounds];
    objc_msgSend(v64, "setBounds:");
  }
  objc_msgSend(a3, "frame", v63);
  v91.origin.double x = x;
  v91.origin.double y = y;
  v91.size.double width = v73;
  v91.size.double height = v74;
  if (!CGRectEqualToRect(v89, v91)) {
    objc_msgSend(a3, "setFrame:", x, y, v73, v74);
  }
}

@end