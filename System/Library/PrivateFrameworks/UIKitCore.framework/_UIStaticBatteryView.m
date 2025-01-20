@interface _UIStaticBatteryView
+ (id)_batteryBodyImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7 filled:(BOOL)a8;
+ (id)_batteryBodyImageWithSize:(double)a3 forScale:(double)a4 batteryRect:(double)a5 cornerRadius:(double)a6 lineWidth:(double)a7 withBoltCutOutOfSize:(double)a8 inRect:(double)a9 boltFlipped:(uint64_t)a10;
+ (id)_batteryBoltImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5;
+ (id)_batteryBoltMaskImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5;
+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5;
+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5 withBoltCutOutOfSize:(CGSize)a6 inRect:(CGRect)a7 boltFlipped:(BOOL)a8;
+ (id)_batteryPinImageWithSize:(CGSize)a3 forScale:(double)a4 complexPinPath:(BOOL)a5;
+ (id)_imageByPunchingImage:(id)a3 inRect:(CGRect)a4 flippedHorizontally:(BOOL)a5 outOfImage:(id)a6 inRect:(CGRect)a7 size:(CGSize)a8 scale:(double)a9;
+ (id)_imageWithRenderedBezierPath:(id)a3 size:(CGSize)a4 scale:(double)a5 pathScaleFactor:(double)a6 stroke:(BOOL)a7 fill:(BOOL)a8;
+ (id)_percentFillImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7;
+ (id)_renderedImageOfSize:(CGSize)a3 scale:(double)a4 withActions:(id)a5;
- (BOOL)_useImagesWithCutoutsForBolt;
- (CGRect)_boltRectForTraitCollection:(id)a3 boltSize:(CGSize)a4;
- (CGRect)_updateBodyLayers;
- (CGSize)_boltPathSize;
- (double)_batteryBoltLargeScaleFactor;
- (double)_batteryBoltSmallScaleFactor;
- (double)_batteryPathScaleFactor;
- (void)_createBodyLayers;
- (void)_createBoltLayersWithSize:(CGSize)a3;
- (void)_createFillLayer;
- (void)_didFinishAnimatingBoltToVisible:(BOOL)a3;
- (void)_updateBatteryFillColor;
- (void)_updateBodyColors;
- (void)_updateFillLayer;
- (void)_willBeginAnimatingBoltToVisible:(BOOL)a3;
- (void)setLowBatteryMode:(int64_t)a3;
- (void)setShowsPercentage:(BOOL)a3;
@end

@implementation _UIStaticBatteryView

- (void)_updateBodyColors
{
  if ([(_UIBatteryView *)self showsPercentage])
  {
    id v3 = [(_UIBatteryView *)self _batteryUnfilledColor];
    uint64_t v4 = [v3 CGColor];

    v5 = [(_UIBatteryView *)self bodyLayer];
    [v5 setContentsMultiplyColor:v4];

    v6 = [(_UIBatteryView *)self pinLayer];
    [v6 setContentsMultiplyColor:v4];

    [(_UIBatteryView *)self _batteryTextColor];
  }
  else
  {
    id v7 = [(_UIBatteryView *)self bodyColor];
    uint64_t v8 = [v7 CGColor];
    v9 = [(_UIBatteryView *)self bodyLayer];
    [v9 setContentsMultiplyColor:v8];

    id v10 = [(_UIBatteryView *)self pinColor];
    uint64_t v11 = [v10 CGColor];
    v12 = [(_UIBatteryView *)self pinLayer];
    [v12 setContentsMultiplyColor:v11];

    [(_UIBatteryView *)self boltColor];
  }
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v15 CGColor];
  v14 = [(_UIBatteryView *)self boltLayer];
  [v14 setContentsMultiplyColor:v13];
}

- (CGRect)_updateBodyLayers
{
  id v3 = [(UIView *)self traitCollection];
  BOOL v4 = [(_UIStaticBatteryView *)self _useImagesWithCutoutsForBolt];
  BOOL v5 = [(UIView *)self _shouldReverseLayoutDirection];
  BOOL v6 = [(_UIBatteryView *)self showsPercentage];
  [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
  double v8 = v7;
  [v3 displayScale];
  double v10 = v9;
  [(_UIBatteryView *)self _batterySizeForTraitCollection:v3];
  double v65 = v11;
  [(_UIBatteryView *)self _pinSizeForTraitCollection:v3];
  double v13 = v12;
  double v67 = v14;
  [(_UIBatteryView *)self _bodyRectForTraitCollection:v3];
  double v16 = v15;
  double v68 = v18;
  double v69 = v17;
  double v70 = v19;
  [(UIView *)self bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v66 = v26;
  if ([(_UIBatteryView *)self rounded])
  {
    double v27 = v70 / 3.125;
  }
  else
  {
    [(_UIBatteryView *)self _outsideCornerRadiusForTraitCollection:v3];
    double v27 = v28 + v8 * -0.5;
  }
  double v64 = v27;
  if (v4)
  {
    v29 = [(_UIBatteryView *)self boltMaskLayer];
    [v29 bounds];
    double v63 = v16;
    double v31 = v30;
    double v62 = v21;
    double v32 = v8;
    double v34 = v33;

    [(_UIStaticBatteryView *)self _boltPathSize];
    uint64_t v36 = v35;
    uint64_t v61 = v37;
    -[_UIStaticBatteryView _boltRectForTraitCollection:boltSize:](self, "_boltRectForTraitCollection:boltSize:", v3, v31, v34);
    double v8 = v32;
    double v21 = v62;
    double v16 = v63;
    uint64_t v60 = v36;
    double v38 = v66;
    v43 = objc_msgSend((id)objc_opt_class(), "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:withBoltCutOutOfSize:inRect:boltFlipped:", v5, v25, v66, v10, v63, v69, v68, v70, v64, *(void *)&v8, v60, v61, v39, v40, v41, v42);
  }
  else
  {
    v44 = objc_opt_class();
    double v45 = 0.0;
    if (!v6) {
      double v45 = v8;
    }
    double v38 = v66;
    v43 = objc_msgSend(v44, "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:filled:", v6, v25, v66, v10, v16, v69, v68, v70, v64, *(void *)&v45);
  }
  id v46 = v43;
  uint64_t v47 = [v46 CGImage];
  v48 = [(_UIBatteryView *)self bodyLayer];
  [v48 setContents:v47];

  v49 = [(_UIBatteryView *)self bodyLayer];
  objc_msgSend(v49, "setFrame:", v21, v23, v25, v38);

  v50 = [(_UIBatteryView *)self boltMaskLayer];
  [v50 setHidden:v4];

  v71.origin.x = v21;
  v71.origin.y = v23;
  v71.size.width = v25;
  v71.size.height = v38;
  CGFloat v51 = CGRectGetMidY(v71) + v67 * -0.5;
  v52 = [(_UIBatteryView *)self pinLayer];
  objc_msgSend(v52, "setFrame:", v8 + v65, v51, v13, v67);

  objc_msgSend((id)objc_opt_class(), "_batteryPinImageWithSize:forScale:complexPinPath:", -[_UIBatteryView internalSizeCategory](self, "internalSizeCategory") == 2, v13, v67, v10);
  id v53 = objc_claimAutoreleasedReturnValue();
  uint64_t v54 = [v53 CGImage];
  v55 = [(_UIBatteryView *)self pinLayer];
  [v55 setContents:v54];

  double v56 = v16;
  double v58 = v68;
  double v57 = v69;
  double v59 = v70;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (CGSize)_boltPathSize
{
  id v3 = [(_UIBatteryView *)self boltMaskLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(_UIStaticBatteryView *)self _batteryPathScaleFactor];
  double v9 = v7 / v8;
  double v10 = v5 / v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)_updateFillLayer
{
  id v3 = [(UIView *)self traitCollection];
  BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
  [(_UIBatteryView *)self _bodyRectForTraitCollection:v3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v3 displayScale];
  double v14 = v13;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v41 = *MEMORY[0x1E4F1DB28];
  long long v42 = v15;
  double v40 = 0.0;
  [(_UIBatteryView *)self _fillLayerFrame:&v41 cornerRadius:&v40];
  if ([(_UIStaticBatteryView *)self _useImagesWithCutoutsForBolt])
  {
    double v16 = [(_UIBatteryView *)self boltMaskLayer];
    [v16 bounds];
    double v18 = v17;
    double v20 = v19;

    [(_UIStaticBatteryView *)self _boltPathSize];
    double v22 = v21;
    double v24 = v23;
    -[_UIStaticBatteryView _boltRectForTraitCollection:boltSize:](self, "_boltRectForTraitCollection:boltSize:", v3, v18, v20);
    v29 = objc_msgSend((id)objc_opt_class(), "_batteryFillImageWithSize:forScale:cornerRadius:withBoltCutOutOfSize:inRect:boltFlipped:", v4, v42, v14, v40, v22, v24, v25 - *(double *)&v41, v26 - *((double *)&v41 + 1), v27, v28);
  }
  else if ([(_UIBatteryView *)self showsPercentage])
  {
    [(_UIBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
    double v31 = v30;
    if ([(_UIBatteryView *)self rounded])
    {
      double v32 = v12 / 3.125;
    }
    else
    {
      [(_UIBatteryView *)self _outsideCornerRadiusForTraitCollection:v3];
      double v32 = v33 + v31 * -0.5;
    }
    v29 = objc_msgSend((id)objc_opt_class(), "_percentFillImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:", v42, v14, v6, v8, v10, v12, v32, 0);
  }
  else
  {
    v29 = [(id)objc_opt_class() _batteryFillImageWithSize:v42 forScale:v14 cornerRadius:v40];
  }
  id v34 = v29;
  uint64_t v35 = [v34 CGImage];
  uint64_t v36 = [(_UIBatteryView *)self fillLayer];
  [v36 setContents:v35];

  long long v37 = v41;
  long long v38 = v42;
  uint64_t v39 = [(_UIBatteryView *)self fillLayer];
  objc_msgSend(v39, "setFrame:", v37, v38);
}

- (void)_updateBatteryFillColor
{
  id v3 = [(_UIBatteryView *)self _batteryFillColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(_UIBatteryView *)self fillLayer];
  [v5 setContentsMultiplyColor:v4];

  double v6 = [(_UIBatteryView *)self fillLayer];
  LODWORD(v7) = 1.0;
  [v6 setOpacity:v7];

  if ([(_UIBatteryView *)self showsPercentage])
  {
    [(_UIStaticBatteryView *)self _updateBodyColors];
  }
}

- (BOOL)_useImagesWithCutoutsForBolt
{
  if ([(_UIBatteryView *)self showsPercentage] || self->_inflightBoltAnimationCount) {
    return 0;
  }
  return [(_UIBatteryView *)self _shouldShowBolt];
}

+ (id)_batteryPinImageWithSize:(CGSize)a3 forScale:(double)a4 complexPinPath:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB265108 != -1) {
    dispatch_once(&qword_1EB265108, &__block_literal_global_27_2);
  }
  double v10 = [_UISignalViewCacheKey alloc];
  double v11 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:](v10, "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, v5, width, height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0, 0.0, *(void *)&a4);
  double v12 = [(id)qword_1EB265100 objectForKey:v11];
  if (!v12)
  {
    double v13 = objc_msgSend(a1, "_pinBezierPathForSize:isComplex:", v5, width, height);
    double v12 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v13, 0, 1, width, height, a4, 1.0);
    [(id)qword_1EB265100 setObject:v12 forKey:v11];
  }
  return v12;
}

+ (id)_batteryBodyImageWithSize:(double)a3 forScale:(double)a4 batteryRect:(double)a5 cornerRadius:(double)a6 lineWidth:(double)a7 withBoltCutOutOfSize:(double)a8 inRect:(double)a9 boltFlipped:(uint64_t)a10
{
  if (qword_1EB2650E8 != -1) {
    dispatch_once(&qword_1EB2650E8, &__block_literal_global_23_4);
  }
  uint64_t v28 = [_UISignalViewCacheKey alloc];
  v29 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v28, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, a11, a2, a3, a5, a6, a7, a8, a9, a12, *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8), *(void *)&a15, *(void *)&a16, *(void *)&a17, *(void *)&a18, *(void *)&a4);
  double v30 = [(id)qword_1EB2650E0 objectForKey:v29];
  if (!v30)
  {
    double v31 = objc_msgSend(a1, "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:filled:", 0, a2, a3, a4, a5, a6, a7, a8, a9, *(void *)&a12);
    double v32 = objc_msgSend(a1, "_batteryBoltMaskImageWithSize:boltSize:forScale:", a13, a14, a13, a14, a4);
    double v30 = objc_msgSend((id)objc_opt_class(), "_imageByPunchingImage:inRect:flippedHorizontally:outOfImage:inRect:size:scale:", v32, a11, v31, a15, a16, a17, a18, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a2, a3, *(void *)&a2, *(void *)&a3, *(void *)&a4);
    [(id)qword_1EB2650E0 setObject:v30 forKey:v29];
  }
  return v30;
}

+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5 withBoltCutOutOfSize:(CGSize)a6 inRect:(CGRect)a7 boltFlipped:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a6.height;
  double width = a6.width;
  double v21 = a3.height;
  double v12 = a3.width;
  if (qword_1EB265148 != -1) {
    dispatch_once(&qword_1EB265148, &__block_literal_global_35_5);
  }
  double v14 = [_UISignalViewCacheKey alloc];
  long long v15 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v14, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, v8, v12, v21, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), a5, 0.0, *(void *)&width, *(void *)&height, *(void *)&a7.origin.x, *(void *)&a7.origin.y, *(void *)&a7.size.width, *(void *)&a7.size.height, *(void *)&a4);
  double v16 = [(id)qword_1EB265140 objectForKey:v15];
  if (!v16)
  {
    double v17 = objc_msgSend(a1, "_batteryFillImageWithSize:forScale:cornerRadius:", v12, v21, a4, a5);
    double v18 = objc_msgSend(a1, "_batteryBoltMaskImageWithSize:boltSize:forScale:", width, height, width, height, a4);
    double v16 = objc_msgSend((id)objc_opt_class(), "_imageByPunchingImage:inRect:flippedHorizontally:outOfImage:inRect:size:scale:", v18, v8, v17, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v12, v21, *(void *)&v12, *(void *)&v21, *(void *)&a4);
    [(id)qword_1EB265140 setObject:v16 forKey:v15];
  }
  return v16;
}

- (CGRect)_boltRectForTraitCollection:(id)a3 boltSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [(_UIBatteryView *)self _bodyRectForTraitCollection:a3];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat v9 = v21.size.width;
  CGFloat v10 = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = v9;
  v22.size.double height = v10;
  double MidY = CGRectGetMidY(v22);
  [(_UIStaticBatteryView *)self _batteryBoltLargeScaleFactor];
  double v14 = v13;
  [(_UIBatteryView *)self _batteryBoltScaleFactorMultiplier];
  double v16 = v14 * v15;
  double v17 = width * v16;
  double v18 = height * v16;
  double v19 = MidX - width * v16 * 0.5;
  double v20 = MidY - v18 * 0.5;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (double)_batteryPathScaleFactor
{
  [(_UIStaticBatteryView *)self _batteryBoltLargeScaleFactor];
  v7.receiver = self;
  v7.super_class = (Class)_UIStaticBatteryView;
  double v4 = 1.0 / v3;
  [(_UIBatteryView *)&v7 _batteryBoltLargeScaleFactor];
  return v4 / (1.0 / v5);
}

- (double)_batteryBoltLargeScaleFactor
{
  return 0.5;
}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.375;
}

- (void)_createBoltLayersWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(UIView *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  [(_UIStaticBatteryView *)self _batteryPathScaleFactor];
  double v10 = width * v9;
  double v11 = height * v9;
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v14 = objc_msgSend((id)objc_opt_class(), "_batteryBoltMaskImageWithSize:boltSize:forScale:", width * v9, height * v9, width, height, v8);
  double v15 = [MEMORY[0x1E4F39BE8] layer];
  id v20 = v14;
  objc_msgSend(v15, "setContents:", objc_msgSend(v20, "CGImage"));
  double v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  [v15 setCompositingFilter:v16];

  objc_msgSend(v15, "setBounds:", v12, v13, v10, v11);
  [(_UIBatteryView *)self setBoltMaskLayer:v15];
  double v17 = objc_msgSend((id)objc_opt_class(), "_batteryBoltImageWithSize:boltSize:forScale:", v10, v11, width, height, v8);
  double v18 = [MEMORY[0x1E4F39BE8] layer];
  id v19 = v17;
  objc_msgSend(v18, "setContents:", objc_msgSend(v19, "CGImage"));
  objc_msgSend(v18, "setBounds:", v12, v13, v10, v11);
  [(_UIBatteryView *)self setBoltLayer:v18];
}

+ (id)_batteryBoltMaskImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  if (qword_1EB265128 != -1) {
    dispatch_once(&qword_1EB265128, &__block_literal_global_31_5);
  }
  double v11 = [_UISignalViewCacheKey alloc];
  double v12 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v11, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, 0, v9, v8, *(void *)&width, *(void *)&height, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a5);
  double v13 = [(id)qword_1EB265120 objectForKey:v12];
  if (!v13)
  {
    if (v9 / width <= v8 / height) {
      double v14 = v9 / width;
    }
    else {
      double v14 = v8 / height;
    }
    double v15 = [a1 _boltMaskBezierPath];
    double v13 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v15, 0, 1, v9, v8, a5, v14);
    [(id)qword_1EB265120 setObject:v13 forKey:v12];
  }
  return v13;
}

+ (id)_batteryBoltImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  if (qword_1EB265118 != -1) {
    dispatch_once(&qword_1EB265118, &__block_literal_global_29_5);
  }
  double v11 = [_UISignalViewCacheKey alloc];
  double v12 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v11, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, 0, v9, v8, *(void *)&width, *(void *)&height, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a5);
  double v13 = [(id)qword_1EB265110 objectForKey:v12];
  if (!v13)
  {
    if (v9 / width <= v8 / height) {
      double v14 = v9 / width;
    }
    else {
      double v14 = v8 / height;
    }
    double v15 = objc_msgSend(a1, "_boltBezierPathForSize:", width, height);
    double v13 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v15, 0, 1, v9, v8, a5, v14);
    [(id)qword_1EB265110 setObject:v13 forKey:v12];
  }
  return v13;
}

- (void)_createFillLayer
{
  id v5 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIBatteryView *)self setFillLayer:v5];
  id v3 = +[UIColor clearColor];
  objc_msgSend(v5, "setContentsMultiplyColor:", objc_msgSend(v3, "CGColor"));

  double v4 = [(_UIBatteryView *)self bodyLayer];
  [v4 addSublayer:v5];

  [(_UIBatteryView *)self setPercentFillLayer:v5];
}

- (void)_createBodyLayers
{
  id v7 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIBatteryView *)self setBodyLayer:v7];
  id v3 = +[UIColor clearColor];
  objc_msgSend(v7, "setContentsMultiplyColor:", objc_msgSend(v3, "CGColor"));

  double v4 = [(UIView *)self layer];
  [v4 addSublayer:v7];

  id v5 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIBatteryView *)self setPinLayer:v5];
  double v6 = [(UIView *)self layer];
  [v6 addSublayer:v5];
}

- (void)setShowsPercentage:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStaticBatteryView;
  [(_UIBatteryView *)&v4 setShowsPercentage:a3];
  [(UIView *)self frame];
  if (!CGRectIsEmpty(v5))
  {
    [(_UIStaticBatteryView *)self _updateBodyLayers];
    [(_UIStaticBatteryView *)self _updateFillLayer];
  }
}

+ (id)_renderedImageOfSize:(CGSize)a3 scale:(double)a4 withActions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  if (!v10)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_UIStaticBatteryView.m", 308, @"Invalid parameter not satisfying: %@", @"actions" object file lineNumber description];
  }
  double v11 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v11 setScale:a4];
  [v11 setOpaque:0];
  [v11 setPreferredRange:0x7FFFLL];
  double v12 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v11, width, height);
  double v13 = [(UIGraphicsImageRenderer *)v12 imageWithActions:v10];

  return v13;
}

+ (id)_imageWithRenderedBezierPath:(id)a3 size:(CGSize)a4 scale:(double)a5 pathScaleFactor:(double)a6 stroke:(BOOL)a7 fill:(BOOL)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92___UIStaticBatteryView__imageWithRenderedBezierPath_size_scale_pathScaleFactor_stroke_fill___block_invoke;
  v19[3] = &unk_1E52EF580;
  double v21 = a6;
  BOOL v22 = a7;
  id v20 = v15;
  BOOL v23 = a8;
  id v16 = v15;
  double v17 = objc_msgSend(a1, "_renderedImageOfSize:scale:withActions:", v19, width, height, a5);

  return v17;
}

+ (id)_imageByPunchingImage:(id)a3 inRect:(CGRect)a4 flippedHorizontally:(BOOL)a5 outOfImage:(id)a6 inRect:(CGRect)a7 size:(CGSize)a8 scale:(double)a9
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  CGFloat v15 = a4.size.height;
  CGFloat v16 = a4.size.width;
  CGFloat v17 = a4.origin.y;
  CGFloat v18 = a4.origin.x;
  id v20 = a3;
  id v21 = a6;
  if (a5)
  {
    id v22 = [v20 imageWithHorizontallyFlippedOrientation];
  }
  else
  {
    id v22 = v20;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102___UIStaticBatteryView__imageByPunchingImage_inRect_flippedHorizontally_outOfImage_inRect_size_scale___block_invoke;
  v27[3] = &unk_1E52EF5A8;
  CGFloat v30 = x;
  CGFloat v31 = y;
  CGFloat v32 = width;
  CGFloat v33 = height;
  id v28 = v21;
  id v29 = v22;
  CGFloat v34 = v18;
  CGFloat v35 = v17;
  CGFloat v36 = v16;
  CGFloat v37 = v15;
  id v23 = v22;
  id v24 = v21;
  double v25 = objc_msgSend(a1, "_renderedImageOfSize:scale:withActions:", v27, a9, v39, v40);

  return v25;
}

+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5
{
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB265138 != -1) {
    dispatch_once(&qword_1EB265138, &__block_literal_global_33_7);
  }
  id v10 = [_UISignalViewCacheKey alloc];
  double v11 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:](v10, "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, 0, width, height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), a5, 0.0, *(void *)&a4);
  double v12 = [(id)qword_1EB265130 objectForKey:v11];
  if (!v12)
  {
    double v13 = +[UIBezierPath _continuousRoundedCARectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedCARectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height, a5, a5);
    double v12 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v13, 0, 1, width, height, a4, 1.0);
    [(id)qword_1EB265130 setObject:v12 forKey:v11];
  }
  return v12;
}

- (void)_willBeginAnimatingBoltToVisible:(BOOL)a3
{
  ++self->_inflightBoltAnimationCount;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(_UIStaticBatteryView *)self _updateBodyLayers];
  [(_UIStaticBatteryView *)self _updateFillLayer];
  objc_super v4 = (void *)MEMORY[0x1E4F39CF8];
  [v4 commit];
}

- (void)_didFinishAnimatingBoltToVisible:(BOOL)a3
{
  --self->_inflightBoltAnimationCount;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(_UIStaticBatteryView *)self _updateBodyLayers];
  [(_UIStaticBatteryView *)self _updateFillLayer];
  objc_super v4 = (void *)MEMORY[0x1E4F39CF8];
  [v4 commit];
}

- (void)setLowBatteryMode:(int64_t)a3
{
  BOOL v5 = [(_UIBatteryView *)self isLowBattery];
  v6.receiver = self;
  v6.super_class = (Class)_UIStaticBatteryView;
  [(_UIBatteryView *)&v6 setLowBatteryMode:a3];
  if (v5 != [(_UIBatteryView *)self isLowBattery]) {
    [(_UIStaticBatteryView *)self _updateBatteryFillColor];
  }
}

+ (id)_batteryBodyImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7 filled:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a3.height;
  double v15 = a3.width;
  if (qword_1EB2650D8 != -1) {
    dispatch_once(&qword_1EB2650D8, &__block_literal_global_662);
  }
  CGFloat v17 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UISignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, v8, v15, v14, x, y, width, height, a6, a7, *(void *)&a4);
  CGFloat v18 = [(id)_MergedGlobals_1328 objectForKey:v17];
  if (!v18)
  {
    id v19 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, a6);
    [v19 setLineWidth:a7];
    CGFloat v18 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v19, 1, v8, v15, v14, a4, 1.0);
    [(id)_MergedGlobals_1328 setObject:v18 forKey:v17];
  }
  return v18;
}

+ (id)_percentFillImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a3.height;
  double v13 = a3.width;
  if (qword_1EB2650F8 != -1) {
    dispatch_once(&qword_1EB2650F8, &__block_literal_global_25_7);
  }
  double v15 = -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UISignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, 0, v13, v12, x, y, width, height, a6, a7, *(void *)&a4);
  CGFloat v16 = [(id)qword_1EB2650F0 objectForKey:v15];
  if (!v16)
  {
    if (width >= a6 + a6) {
      double v17 = width;
    }
    else {
      double v17 = a6 + a6;
    }
    CGFloat v18 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v17, height, a6);
    [v18 setLineWidth:a7];
    CGFloat v16 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v18, 1, 1, v13, v12, a4, 1.0);
    [(id)qword_1EB2650F0 setObject:v16 forKey:v15];
  }
  return v16;
}

@end