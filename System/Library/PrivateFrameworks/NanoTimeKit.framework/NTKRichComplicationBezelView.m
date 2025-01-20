@interface NTKRichComplicationBezelView
+ (CGAffineTransform)transformForState:(SEL)a3;
+ (id)keylineImageWithFilled:(BOOL)a3 forDevice:(id)a4;
+ (id)keylineViewForDevice:(id)a3;
+ (id)layoutRuleForState:(int64_t)a3 faceBounds:(CGRect)a4 dialDiameter:(double)a5 forDevice:(id)a6;
+ (id)viewWithLegacyComplicationType:(unint64_t)a3;
+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8 bezelTextUpdateHandler:(id)a9;
- (BOOL)interactive;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NTKRichComplicationBezelView)init;
- (NTKRichComplicationBezelView)initWithFamily:(int64_t)a3;
- (NTKRichComplicationBezelViewDelegate)delegate;
- (UIColor)bezelTextColor;
- (double)bezelTextAlpha;
- (double)bezelTextRadius;
- (double)bezelTextWidthInRadius;
- (void)_createHitTestPathIfNecessary;
- (void)_setLayoutTransformToView:(id)a3 origin:(CGPoint)a4 rotationInDegree:(double)a5 centerScale:(double)a6;
- (void)_updateHitTestShape:(int64_t)a3 frame:(CGRect)a4;
- (void)setBezelTextAlpha:(double)a3;
- (void)setBezelTextColor:(id)a3;
- (void)setBezelTextRadius:(double)a3;
- (void)setBezelTextWidthInRadius:(double)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NTKRichComplicationBezelView

+ (id)keylineImageWithFilled:(BOOL)a3 forDevice:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  double v6 = ((double (*)(void))NTKWhistlerSubdialComplicationDistanceFromCenter)();
  double v7 = NTKWhistlerSubdialComplicationEditingInset(v5);
  double v8 = NTKWhistlerSubdialComplicationDistanceFromCenter(v5);
  +[NTKAnalogUtilities largeDialDiameterForDevice:v5];
  double v10 = v9;
  double v11 = NTKKeylineWidth();
  double v12 = NTKWhistlerSubdialComplicationDiameter(v5);
  id v13 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_4);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
  if (WeakRetained)
  {
    v15 = WeakRetained;
    id v16 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
    if (v16 == v13)
    {
      uint64_t v17 = [v13 version];
      uint64_t v18 = _LayoutConstants___previousCLKDeviceVersion_4;

      if (v17 == v18) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v19 = objc_storeWeak(&_LayoutConstants___cachedDevice_4, v13);
  _LayoutConstants___previousCLKDeviceVersion_4 = [v13 version];

  ___LayoutConstants_block_invoke_4(v20, (uint64_t)v13);
LABEL_6:
  double v21 = v6 - v7;
  double v22 = v10 * 0.5 - v11;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_4);
  double v23 = *(double *)&_LayoutConstants___constants_0_0;

  v24 = [off_1E62BD5F8 heartKeylineWithDevice:v13 outerRadius:v4 innerRadius:v22 sideComplicationDistance:v21 + v12 * 0.5 + v23 topComplicationDistance:v21 strokeWidth:v8 * 0.95 filled:NTKKeylineWidth()];

  return v24;
}

+ (id)keylineViewForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [a1 keylineImageWithFilled:0 forDevice:v4];
  double v6 = v5;
  if (v5)
  {
    double v7 = NTKKeylineViewWithImage(v5);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__NTKRichComplicationBezelView_keylineViewForDevice___block_invoke;
    v10[3] = &unk_1E62C12D0;
    id v11 = v4;
    double v8 = +[NTKKeylineTouchable touchableWithHandler:v10];
    [v7 setTouchable:v8];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

uint64_t __53__NTKRichComplicationBezelView_keylineViewForDevice___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7 = a2;
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v7 bounds];
  uint64_t v20 = +[NTKRichComplicationBezelUtilities hitTestPathWithViewBounds:shape:shapeFrame:forDevice:](NTKRichComplicationBezelUtilities, "hitTestPathWithViewBounds:shape:shapeFrame:forDevice:", 3, *(void *)(a1 + 32), v9, v11, v13, v15, v16, v17, v18, v19);
  [v7 bounds];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  v32.origin.x = v22;
  v32.origin.y = v24;
  v32.size.width = v26;
  v32.size.height = v28;
  v31.x = a3;
  v31.y = a4;
  if (CGRectContainsPoint(v32, v31)) {
    uint64_t v29 = objc_msgSend(v20, "containsPoint:", a3, a4);
  }
  else {
    uint64_t v29 = 0;
  }

  return v29;
}

+ (id)layoutRuleForState:(int64_t)a3 faceBounds:(CGRect)a4 dialDiameter:(double)a5 forDevice:(id)a6
{
  id v8 = a6;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v9 = [a1 keylineImageWithFilled:0 forDevice:v8];
    [v9 size];
  }
  CLKSizeCenteredInRectForDevice();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  [a1 transformForState:a3];
  double v18 = *MEMORY[0x1E4FB2848];
  double v19 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v20 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v21 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  CGFloat v22 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:", v8, 3, 3, 1, v24, v11, v13, v15, v17, v18, v19, v20, v21);

  return v22;
}

+ (CGAffineTransform)transformForState:(SEL)a3
{
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return CGAffineTransformMakeScale(retstr, 0.95, 0.95);
  }
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return result;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = objc_alloc_init(NTKRichComplicationBezelEmptyView);
  }
  return v4;
}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8 bezelTextUpdateHandler:(id)a9
{
  BOOL v13 = a5;
  id v18 = a3;
  id v15 = a4;
  id v16 = a9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(float *)&double v17 = a8;
      +[NTKRichComplicationBezelBaseCircularView updateCustomDataAnimationFromEarlierView:v18 laterView:v15 isForward:v13 animationType:a6 animationDuration:v16 animationFraction:a7 bezelTextUpdateHandler:v17];
    }
  }
}

- (NTKRichComplicationBezelView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBezelView;
  return [(CDRichComplicationView *)&v3 initWithFamily:9];
}

- (NTKRichComplicationBezelView)initWithFamily:(int64_t)a3
{
  if (a3 == 9)
  {
    self = [(NTKRichComplicationBezelView *)self init];
    objc_super v3 = self;
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(NTKRichComplicationBezelView *)self _createHitTestPathIfNecessary];
  [(NTKRichComplicationBezelView *)self bounds];
  v11.double x = x;
  v11.double y = y;
  BOOL v7 = CGRectContainsPoint(v12, v11);
  if (v7)
  {
    hitTestPath = self->_hitTestPath;
    LOBYTE(v7) = -[UIBezierPath containsPoint:](hitTestPath, "containsPoint:", x, y);
  }
  return v7;
}

- (void)_createHitTestPathIfNecessary
{
  if (!self->_hitTestPath
    || ([(NTKRichComplicationBezelView *)self bounds], !CGRectEqualToRect(v19, self->_hitTestBounds)))
  {
    [(NTKRichComplicationBezelView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    int64_t hitTestShape = self->_hitTestShape;
    CGRect v12 = [(CDRichComplicationView *)self device];
    +[NTKRichComplicationBezelUtilities hitTestPathWithViewBounds:shape:shapeFrame:forDevice:](NTKRichComplicationBezelUtilities, "hitTestPathWithViewBounds:shape:shapeFrame:forDevice:", hitTestShape, v12, v4, v6, v8, v10, self->_hitTestShapeFrame.origin.x, self->_hitTestShapeFrame.origin.y, self->_hitTestShapeFrame.size.width, self->_hitTestShapeFrame.size.height);
    BOOL v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    hitTestPath = self->_hitTestPath;
    self->_hitTestPath = v13;

    [(NTKRichComplicationBezelView *)self bounds];
    self->_hitTestBounds.origin.double x = v15;
    self->_hitTestBounds.origin.double y = v16;
    self->_hitTestBounds.size.width = v17;
    self->_hitTestBounds.size.height = v18;
  }
}

- (void)_updateHitTestShape:(int64_t)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (self->_hitTestShape != a3 || !CGRectEqualToRect(a4, self->_hitTestShapeFrame))
  {
    hitTestPath = self->_hitTestPath;
    self->_hitTestPath = 0;

    self->_int64_t hitTestShape = a3;
    self->_hitTestShapeFrame.origin.CGFloat x = x;
    self->_hitTestShapeFrame.origin.CGFloat y = y;
    self->_hitTestShapeFrame.size.CGFloat width = width;
    self->_hitTestShapeFrame.size.CGFloat height = height;
  }
}

- (void)_setLayoutTransformToView:(id)a3 origin:(CGPoint)a4 rotationInDegree:(double)a5 centerScale:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  [(NTKRichComplicationBezelView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v24.c = v15;
  *(_OWORD *)&v24.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v23.a = *(_OWORD *)&v24.a;
  *(_OWORD *)&v23.c = v15;
  *(_OWORD *)&v23.tdouble x = *(_OWORD *)&v24.tx;
  CGAffineTransformTranslate(&v24, &v23, x, y);
  [v10 center];
  CGFloat v17 = v12 * 0.5 - x - v16;
  [v10 center];
  CGFloat v19 = v14 * 0.5 - y - v18;
  CGAffineTransform v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, v17, v19);
  CGAffineTransform v24 = v23;
  CGAffineTransform v22 = v23;
  CGAffineTransformScale(&v23, &v22, a6, a6);
  CGAffineTransform v24 = v23;
  CLKDegreesToRadians();
  CGAffineTransform v22 = v24;
  CGAffineTransformRotate(&v23, &v22, v20);
  CGAffineTransform v24 = v23;
  CGAffineTransform v22 = v23;
  CGAffineTransformTranslate(&v23, &v22, -v17, -v19);
  CGAffineTransform v24 = v23;
  CGAffineTransform v21 = v23;
  [v10 setTransform:&v21];
}

- (double)bezelTextRadius
{
  return self->bezelTextRadius;
}

- (void)setBezelTextRadius:(double)a3
{
  self->bezelTextRadius = a3;
}

- (UIColor)bezelTextColor
{
  return self->_bezelTextColor;
}

- (void)setBezelTextColor:(id)a3
{
}

- (double)bezelTextWidthInRadius
{
  return self->_bezelTextWidthInRadius;
}

- (void)setBezelTextWidthInRadius:(double)a3
{
  self->_bezelTextWidthInRadius = a3;
}

- (double)bezelTextAlpha
{
  return self->_bezelTextAlpha;
}

- (void)setBezelTextAlpha:(double)a3
{
  self->_bezelTextAlpha = a3;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (NTKRichComplicationBezelViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKRichComplicationBezelViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bezelTextColor, 0);

  objc_storeStrong((id *)&self->_hitTestPath, 0);
}

@end