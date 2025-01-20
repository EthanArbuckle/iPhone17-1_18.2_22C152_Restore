@interface _UIStatusBarStaticBatteryView
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

@implementation _UIStatusBarStaticBatteryView

- (void)_createBodyLayers
{
  id v7 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIStatusBarBatteryView *)self setBodyLayer:v7];
  id v3 = +[UIColor clearColor];
  objc_msgSend(v7, "setContentsMultiplyColor:", objc_msgSend(v3, "CGColor"));

  v4 = [(UIView *)self layer];
  [v4 addSublayer:v7];

  v5 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIStatusBarBatteryView *)self setPinLayer:v5];
  v6 = [(UIView *)self layer];
  [v6 addSublayer:v5];
}

- (void)_createFillLayer
{
  id v5 = [MEMORY[0x1E4F39BE8] layer];
  [(_UIStatusBarBatteryView *)self setFillLayer:v5];
  id v3 = +[UIColor clearColor];
  objc_msgSend(v5, "setContentsMultiplyColor:", objc_msgSend(v3, "CGColor"));

  v4 = [(_UIStatusBarBatteryView *)self bodyLayer];
  [v4 addSublayer:v5];

  [(_UIStatusBarBatteryView *)self setPercentFillLayer:v5];
}

- (void)_createBoltLayersWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(UIView *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  [(_UIStatusBarStaticBatteryView *)self _batteryPathScaleFactor];
  double v10 = width * v9;
  double v11 = height * v9;
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v14 = objc_msgSend((id)objc_opt_class(), "_batteryBoltMaskImageWithSize:boltSize:forScale:", width * v9, height * v9, width, height, v8);
  v15 = [MEMORY[0x1E4F39BE8] layer];
  id v20 = v14;
  objc_msgSend(v15, "setContents:", objc_msgSend(v20, "CGImage"));
  v16 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
  [v15 setCompositingFilter:v16];

  objc_msgSend(v15, "setBounds:", v12, v13, v10, v11);
  [(_UIStatusBarBatteryView *)self setBoltMaskLayer:v15];
  v17 = objc_msgSend((id)objc_opt_class(), "_batteryBoltImageWithSize:boltSize:forScale:", v10, v11, width, height, v8);
  v18 = [MEMORY[0x1E4F39BE8] layer];
  id v19 = v17;
  objc_msgSend(v18, "setContents:", objc_msgSend(v19, "CGImage"));
  objc_msgSend(v18, "setBounds:", v12, v13, v10, v11);
  [(_UIStatusBarBatteryView *)self setBoltLayer:v18];
}

- (CGSize)_boltPathSize
{
  id v3 = [(_UIStatusBarBatteryView *)self boltMaskLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(_UIStatusBarStaticBatteryView *)self _batteryPathScaleFactor];
  double v9 = v7 / v8;
  double v10 = v5 / v8;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (CGRect)_boltRectForTraitCollection:(id)a3 boltSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  [(_UIStatusBarBatteryView *)self _bodyRectForTraitCollection:a3];
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
  [(_UIStatusBarStaticBatteryView *)self _batteryBoltLargeScaleFactor];
  double v14 = v13;
  [(_UIStatusBarBatteryView *)self _batteryBoltScaleFactorMultiplier];
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

- (CGRect)_updateBodyLayers
{
  id v3 = [(UIView *)self traitCollection];
  BOOL v4 = [(_UIStatusBarStaticBatteryView *)self _useImagesWithCutoutsForBolt];
  BOOL v5 = [(UIView *)self _shouldReverseLayoutDirection];
  BOOL v6 = [(_UIStatusBarBatteryView *)self showsPercentage];
  [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
  double v8 = v7;
  [v3 displayScale];
  double v10 = v9;
  [(_UIStatusBarBatteryView *)self _batterySizeForTraitCollection:v3];
  double v62 = v11;
  [(_UIStatusBarBatteryView *)self _pinSizeForTraitCollection:v3];
  double v13 = v12;
  double v64 = v14;
  [(_UIStatusBarBatteryView *)self _bodyRectForTraitCollection:v3];
  double v16 = v15;
  double v65 = v18;
  double v66 = v17;
  double v67 = v19;
  [(UIView *)self bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v63 = v26;
  if ([(_UIStatusBarBatteryView *)self rounded])
  {
    double v27 = v67 / 3.125;
  }
  else
  {
    [(_UIStatusBarBatteryView *)self _outsideCornerRadiusForTraitCollection:v3];
    double v27 = v28 + v8 * -0.5;
  }
  double v61 = v27;
  if (v4)
  {
    v29 = [(_UIStatusBarBatteryView *)self boltMaskLayer];
    [v29 bounds];
    double v60 = v16;
    double v31 = v30;
    double v59 = v21;
    double v32 = v8;
    double v34 = v33;

    [(_UIStatusBarStaticBatteryView *)self _boltPathSize];
    uint64_t v36 = v35;
    uint64_t v58 = v37;
    -[_UIStatusBarStaticBatteryView _boltRectForTraitCollection:boltSize:](self, "_boltRectForTraitCollection:boltSize:", v3, v31, v34);
    double v8 = v32;
    double v21 = v59;
    double v16 = v60;
    uint64_t v57 = v36;
    double v38 = v63;
    objc_msgSend((id)objc_opt_class(), "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:withBoltCutOutOfSize:inRect:boltFlipped:", v5, v25, v63, v10, v60, v66, v65, v67, v61, *(void *)&v8, v57, v58, v39, v40, v41, v42);
  }
  else
  {
    double v38 = v63;
    objc_msgSend((id)objc_opt_class(), "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:filled:", v6, v25, v63, v10, v16, v66, v65, v67, v27, *(void *)&v8);
  }
  id v43 = objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v43 CGImage];
  v45 = [(_UIStatusBarBatteryView *)self bodyLayer];
  [v45 setContents:v44];

  v46 = [(_UIStatusBarBatteryView *)self bodyLayer];
  objc_msgSend(v46, "setFrame:", v21, v23, v25, v38);

  v47 = [(_UIStatusBarBatteryView *)self boltMaskLayer];
  [v47 setHidden:v4];

  v68.origin.CGFloat x = v21;
  v68.origin.CGFloat y = v23;
  v68.size.double width = v25;
  v68.size.double height = v38;
  CGFloat v48 = CGRectGetMidY(v68) + v64 * -0.5;
  v49 = [(_UIStatusBarBatteryView *)self pinLayer];
  objc_msgSend(v49, "setFrame:", v8 + v62, v48, v13, v64);

  objc_msgSend((id)objc_opt_class(), "_batteryPinImageWithSize:forScale:complexPinPath:", -[_UIStatusBarBatteryView internalSizeCategory](self, "internalSizeCategory") == 2, v13, v64, v10);
  id v50 = objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v50 CGImage];
  v52 = [(_UIStatusBarBatteryView *)self pinLayer];
  [v52 setContents:v51];

  double v53 = v16;
  double v55 = v65;
  double v54 = v66;
  double v56 = v67;
  result.size.double height = v56;
  result.size.double width = v55;
  result.origin.CGFloat y = v54;
  result.origin.CGFloat x = v53;
  return result;
}

- (void)_updateFillLayer
{
  id v3 = [(UIView *)self traitCollection];
  BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
  [(UIView *)self bounds];
  [(_UIStatusBarBatteryView *)self _bodyRectForTraitCollection:v3];
  [v3 displayScale];
  double v6 = v5;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v41 = *MEMORY[0x1E4F1DB28];
  long long v42 = v7;
  double v40 = 0.0;
  [(_UIStatusBarBatteryView *)self _fillLayerFrame:&v41 cornerRadius:&v40];
  if ([(_UIStatusBarStaticBatteryView *)self _useImagesWithCutoutsForBolt])
  {
    double v8 = [(_UIStatusBarBatteryView *)self boltMaskLayer];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;

    [(_UIStatusBarStaticBatteryView *)self _boltPathSize];
    double v14 = v13;
    double v16 = v15;
    -[_UIStatusBarStaticBatteryView _boltRectForTraitCollection:boltSize:](self, "_boltRectForTraitCollection:boltSize:", v3, v10, v12);
    double v21 = objc_msgSend((id)objc_opt_class(), "_batteryFillImageWithSize:forScale:cornerRadius:withBoltCutOutOfSize:inRect:boltFlipped:", v4, v42, v6, v40, v14, v16, v17 - *(double *)&v41, v18 - *((double *)&v41 + 1), v19, v20);
  }
  else if ([(_UIStatusBarBatteryView *)self showsPercentage])
  {
    [(_UIStatusBarBatteryView *)self _lineWidthAndInterspaceForTraitCollection:v3];
    double v23 = v22;
    [(_UIStatusBarBatteryView *)self _bodyRectForTraitCollection:v3];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    if ([(_UIStatusBarBatteryView *)self rounded])
    {
      double v32 = v31 / 3.125;
    }
    else
    {
      [(_UIStatusBarBatteryView *)self _outsideCornerRadiusForTraitCollection:v3];
      double v32 = v33 + v23 * -0.5;
    }
    double v21 = objc_msgSend((id)objc_opt_class(), "_percentFillImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:", v42, v6, v25, v27, v29, v31, v32, *(void *)&v23);
  }
  else
  {
    double v21 = [(id)objc_opt_class() _batteryFillImageWithSize:v42 forScale:v6 cornerRadius:v40];
  }
  id v34 = v21;
  uint64_t v35 = [v34 CGImage];
  uint64_t v36 = [(_UIStatusBarBatteryView *)self fillLayer];
  [v36 setContents:v35];

  long long v37 = v41;
  long long v38 = v42;
  uint64_t v39 = [(_UIStatusBarBatteryView *)self fillLayer];
  objc_msgSend(v39, "setFrame:", v37, v38);
}

- (void)_updateBodyColors
{
  if ([(_UIStatusBarBatteryView *)self showsPercentage])
  {
    id v3 = [(_UIStatusBarBatteryView *)self _batteryUnfilledColor];
    uint64_t v4 = [v3 CGColor];

    double v5 = [(_UIStatusBarBatteryView *)self bodyLayer];
    [v5 setContentsMultiplyColor:v4];

    double v6 = [(_UIStatusBarBatteryView *)self pinLayer];
    [v6 setContentsMultiplyColor:v4];

    [(_UIStatusBarBatteryView *)self _batteryTextColor];
  }
  else
  {
    id v7 = [(_UIStatusBarBatteryView *)self bodyColor];
    uint64_t v8 = [v7 CGColor];
    double v9 = [(_UIStatusBarBatteryView *)self bodyLayer];
    [v9 setContentsMultiplyColor:v8];

    id v10 = [(_UIStatusBarBatteryView *)self pinColor];
    uint64_t v11 = [v10 CGColor];
    double v12 = [(_UIStatusBarBatteryView *)self pinLayer];
    [v12 setContentsMultiplyColor:v11];

    [(_UIStatusBarBatteryView *)self boltColor];
  }
  id v15 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v15 CGColor];
  double v14 = [(_UIStatusBarBatteryView *)self boltLayer];
  [v14 setContentsMultiplyColor:v13];
}

- (void)_updateBatteryFillColor
{
  id v3 = [(_UIStatusBarBatteryView *)self _batteryFillColor];
  uint64_t v4 = [v3 CGColor];
  double v5 = [(_UIStatusBarBatteryView *)self fillLayer];
  [v5 setContentsMultiplyColor:v4];

  double v6 = [(_UIStatusBarBatteryView *)self fillLayer];
  LODWORD(v7) = 1.0;
  [v6 setOpacity:v7];

  if ([(_UIStatusBarBatteryView *)self showsPercentage])
  {
    [(_UIStatusBarStaticBatteryView *)self _updateBodyColors];
  }
}

- (double)_batteryBoltLargeScaleFactor
{
  return 0.5;
}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.375;
}

- (double)_batteryPathScaleFactor
{
  [(_UIStatusBarStaticBatteryView *)self _batteryBoltLargeScaleFactor];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarStaticBatteryView;
  double v4 = 1.0 / v3;
  [(_UIStatusBarBatteryView *)&v7 _batteryBoltLargeScaleFactor];
  return v4 / (1.0 / v5);
}

- (BOOL)_useImagesWithCutoutsForBolt
{
  if ([(_UIStatusBarBatteryView *)self showsPercentage] || self->_inflightBoltAnimationCount) {
    return 0;
  }
  return [(_UIStatusBarBatteryView *)self _shouldShowBolt];
}

- (void)_willBeginAnimatingBoltToVisible:(BOOL)a3
{
  ++self->_inflightBoltAnimationCount;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(_UIStatusBarStaticBatteryView *)self _updateBodyLayers];
  [(_UIStatusBarStaticBatteryView *)self _updateFillLayer];
  double v4 = (void *)MEMORY[0x1E4F39CF8];
  [v4 commit];
}

- (void)_didFinishAnimatingBoltToVisible:(BOOL)a3
{
  --self->_inflightBoltAnimationCount;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(_UIStatusBarStaticBatteryView *)self _updateBodyLayers];
  [(_UIStatusBarStaticBatteryView *)self _updateFillLayer];
  double v4 = (void *)MEMORY[0x1E4F39CF8];
  [v4 commit];
}

- (void)setShowsPercentage:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarStaticBatteryView;
  [(_UIStatusBarBatteryView *)&v4 setShowsPercentage:a3];
  [(UIView *)self frame];
  if (!CGRectIsEmpty(v5))
  {
    [(_UIStatusBarStaticBatteryView *)self _updateBodyLayers];
    [(_UIStatusBarStaticBatteryView *)self _updateFillLayer];
  }
}

- (void)setLowBatteryMode:(int64_t)a3
{
  BOOL v5 = [(_UIStatusBarBatteryView *)self isLowBattery];
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarStaticBatteryView;
  [(_UIStatusBarBatteryView *)&v6 setLowBatteryMode:a3];
  if (v5 != [(_UIStatusBarBatteryView *)self isLowBattery]) {
    [(_UIStatusBarStaticBatteryView *)self _updateBatteryFillColor];
  }
}

+ (id)_imageWithRenderedBezierPath:(id)a3 size:(CGSize)a4 scale:(double)a5 pathScaleFactor:(double)a6 stroke:(BOOL)a7 fill:(BOOL)a8
{
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101___UIStatusBarStaticBatteryView__imageWithRenderedBezierPath_size_scale_pathScaleFactor_stroke_fill___block_invoke;
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
  v27[2] = __111___UIStatusBarStaticBatteryView__imageByPunchingImage_inRect_flippedHorizontally_outOfImage_inRect_size_scale___block_invoke;
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

+ (id)_renderedImageOfSize:(CGSize)a3 scale:(double)a4 withActions:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  if (!v10)
  {
    CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_UIStatusBarStaticBatteryView.m", 331, @"Invalid parameter not satisfying: %@", @"actions" object file lineNumber description];
  }
  uint64_t v11 = +[UIGraphicsImageRendererFormat defaultFormat];
  [v11 setScale:a4];
  [v11 setOpaque:0];
  [v11 setPreferredRange:0x7FFFLL];
  double v12 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v11, width, height);
  uint64_t v13 = [(UIGraphicsImageRenderer *)v12 imageWithActions:v10];

  return v13;
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
  if (qword_1EB260880 != -1) {
    dispatch_once(&qword_1EB260880, &__block_literal_global_234);
  }
  CGFloat v17 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UIStatusBarSignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, v8, v15, v14, x, y, width, height, a6, a7, *(void *)&a4);
  CGFloat v18 = [(id)_MergedGlobals_1059 objectForKey:v17];
  if (!v18)
  {
    uint64_t v19 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, a6);
    [v19 setLineWidth:a7];
    CGFloat v18 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v19, 1, v8, v15, v14, a4, 1.0);
    [(id)_MergedGlobals_1059 setObject:v18 forKey:v17];
  }
  return v18;
}

+ (id)_batteryBodyImageWithSize:(double)a3 forScale:(double)a4 batteryRect:(double)a5 cornerRadius:(double)a6 lineWidth:(double)a7 withBoltCutOutOfSize:(double)a8 inRect:(double)a9 boltFlipped:(uint64_t)a10
{
  if (qword_1EB260890 != -1) {
    dispatch_once(&qword_1EB260890, &__block_literal_global_23_1);
  }
  id v28 = [_UIStatusBarSignalViewCacheKey alloc];
  id v29 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v28, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, a11, a2, a3, a5, a6, a7, a8, a9, a12, *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8), *(void *)&a15, *(void *)&a16, *(void *)&a17, *(void *)&a18, *(void *)&a4);
  CGFloat v30 = [(id)qword_1EB260888 objectForKey:v29];
  if (!v30)
  {
    CGFloat v31 = objc_msgSend(a1, "_batteryBodyImageWithSize:forScale:batteryRect:cornerRadius:lineWidth:filled:", 0, a2, a3, a4, a5, a6, a7, a8, a9, *(void *)&a12);
    CGFloat v32 = objc_msgSend(a1, "_batteryBoltMaskImageWithSize:boltSize:forScale:", a13, a14, a13, a14, a4);
    CGFloat v30 = objc_msgSend((id)objc_opt_class(), "_imageByPunchingImage:inRect:flippedHorizontally:outOfImage:inRect:size:scale:", v32, a11, v31, a15, a16, a17, a18, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a2, a3, *(void *)&a2, *(void *)&a3, *(void *)&a4);
    [(id)qword_1EB260888 setObject:v30 forKey:v29];
  }
  return v30;
}

+ (id)_percentFillImageWithSize:(CGSize)a3 forScale:(double)a4 batteryRect:(CGRect)a5 cornerRadius:(double)a6 lineWidth:(double)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v12 = a3.height;
  double v13 = a3.width;
  if (qword_1EB2608A0 != -1) {
    dispatch_once(&qword_1EB2608A0, &__block_literal_global_25_3);
  }
  double v15 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UIStatusBarSignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, 0, v13, v12, x, y, width, height, a6, a7, *(void *)&a4);
  CGFloat v16 = [(id)qword_1EB260898 objectForKey:v15];
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
    [(id)qword_1EB260898 setObject:v16 forKey:v15];
  }
  return v16;
}

+ (id)_batteryPinImageWithSize:(CGSize)a3 forScale:(double)a4 complexPinPath:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB2608B0 != -1) {
    dispatch_once(&qword_1EB2608B0, &__block_literal_global_27);
  }
  id v10 = [_UIStatusBarSignalViewCacheKey alloc];
  uint64_t v11 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:](v10, "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, v5, width, height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0, 0.0, *(void *)&a4);
  double v12 = [(id)qword_1EB2608A8 objectForKey:v11];
  if (!v12)
  {
    double v13 = objc_msgSend(a1, "_pinBezierPathForSize:isComplex:", v5, width, height);
    double v12 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v13, 0, 1, width, height, a4, 1.0);
    [(id)qword_1EB2608A8 setObject:v12 forKey:v11];
  }
  return v12;
}

+ (id)_batteryBoltImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  if (qword_1EB2608C0 != -1) {
    dispatch_once(&qword_1EB2608C0, &__block_literal_global_29);
  }
  uint64_t v11 = [_UIStatusBarSignalViewCacheKey alloc];
  double v12 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v11, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, 0, v9, v8, *(void *)&width, *(void *)&height, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a5);
  double v13 = [(id)qword_1EB2608B8 objectForKey:v12];
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
    [(id)qword_1EB2608B8 setObject:v13 forKey:v12];
  }
  return v13;
}

+ (id)_batteryBoltMaskImageWithSize:(CGSize)a3 boltSize:(CGSize)a4 forScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  if (qword_1EB2608D0 != -1) {
    dispatch_once(&qword_1EB2608D0, &__block_literal_global_31);
  }
  uint64_t v11 = [_UIStatusBarSignalViewCacheKey alloc];
  double v12 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v11, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, 0, v9, v8, *(void *)&width, *(void *)&height, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a5);
  double v13 = [(id)qword_1EB2608C8 objectForKey:v12];
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
    [(id)qword_1EB2608C8 setObject:v13 forKey:v12];
  }
  return v13;
}

+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5
{
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB2608E0 != -1) {
    dispatch_once(&qword_1EB2608E0, &__block_literal_global_33_2);
  }
  id v10 = [_UIStatusBarSignalViewCacheKey alloc];
  uint64_t v11 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:](v10, "initWithClass:size:rect:radius:lineWidth:alternate:scale:", a1, 0, width, height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), a5, 0.0, *(void *)&a4);
  double v12 = [(id)qword_1EB2608D8 objectForKey:v11];
  if (!v12)
  {
    double v13 = +[UIBezierPath _bezierPathWithArcRoundedRect:cornerRadius:](UIBezierPath, "_bezierPathWithArcRoundedRect:cornerRadius:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height, a5);
    double v12 = objc_msgSend(a1, "_imageWithRenderedBezierPath:size:scale:pathScaleFactor:stroke:fill:", v13, 0, 1, width, height, a4, 1.0);
    [(id)qword_1EB2608D8 setObject:v12 forKey:v11];
  }
  return v12;
}

+ (id)_batteryFillImageWithSize:(CGSize)a3 forScale:(double)a4 cornerRadius:(double)a5 withBoltCutOutOfSize:(CGSize)a6 inRect:(CGRect)a7 boltFlipped:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a6.height;
  double width = a6.width;
  double v21 = a3.height;
  double v12 = a3.width;
  if (qword_1EB2608F0 != -1) {
    dispatch_once(&qword_1EB2608F0, &__block_literal_global_35_0);
  }
  double v14 = [_UIStatusBarSignalViewCacheKey alloc];
  double v15 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](v14, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a1, v8, v12, v21, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), a5, 0.0, *(void *)&width, *(void *)&height, *(void *)&a7.origin.x, *(void *)&a7.origin.y, *(void *)&a7.size.width, *(void *)&a7.size.height, *(void *)&a4);
  CGFloat v16 = [(id)qword_1EB2608E8 objectForKey:v15];
  if (!v16)
  {
    double v17 = objc_msgSend(a1, "_batteryFillImageWithSize:forScale:cornerRadius:", v12, v21, a4, a5);
    CGFloat v18 = objc_msgSend(a1, "_batteryBoltMaskImageWithSize:boltSize:forScale:", width, height, width, height, a4);
    CGFloat v16 = objc_msgSend((id)objc_opt_class(), "_imageByPunchingImage:inRect:flippedHorizontally:outOfImage:inRect:size:scale:", v18, v8, v17, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v12, v21, *(void *)&v12, *(void *)&v21, *(void *)&a4);
    [(id)qword_1EB2608E8 setObject:v16 forKey:v15];
  }
  return v16;
}

@end