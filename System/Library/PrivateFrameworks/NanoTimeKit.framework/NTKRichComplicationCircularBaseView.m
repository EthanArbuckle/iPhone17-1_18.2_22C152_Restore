@interface NTKRichComplicationCircularBaseView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (CGAffineTransform)transformForState:(SEL)a3;
+ (id)keylineImageWithFilled:(BOOL)a3 forDevice:(id)a4;
+ (id)keylineImageWithFilled:(BOOL)a3 wide:(BOOL)a4 expanded:(BOOL)a5 forDevice:(id)a6;
+ (id)keylineViewForDevice:(id)a3;
+ (id)keylineViewForDevice:(id)a3 wide:(BOOL)a4 expanded:(BOOL)a5;
+ (id)layoutRuleForState:(int64_t)a3 viewCenterInFaceBounds:(CGPoint)a4 position:(int64_t)a5 editingAdjustment:(int64_t)a6 wide:(BOOL)a7 forDevice:(id)a8;
+ (id)layoutRuleForState:(int64_t)a3 viewCenterInFaceBounds:(CGPoint)a4 position:(int64_t)a5 forDevice:(id)a6;
+ (id)viewWithLegacyComplicationType:(unint64_t)a3;
+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8;
- (BOOL)accentedAlternateBackground;
- (NTKRichComplicationCircularBaseView)init;
- (NTKRichComplicationCircularBaseView)initWithFamily:(int64_t)a3;
- (UIColor)platterColor;
- (UIView)contentView;
- (UIView)framingView;
- (double)_contentDiameter;
- (id)_createAndAddColoringLabel;
- (int64_t)position;
- (unint64_t)_adjustFontSizeForLabel:(id)a3 fontWeight:(double)a4 possibleMaxWidths:(id)a5 possibleFontSizes:(id)a6;
- (void)_editingDidEnd;
- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6;
- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5;
- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4;
- (void)_updatePlatterColor;
- (void)layoutSubviews;
- (void)makeBackgroundTransparent;
- (void)setAccentedAlternateBackground:(BOOL)a3;
- (void)setPlatterColor:(id)a3;
- (void)setPosition:(int64_t)a3;
@end

@implementation NTKRichComplicationCircularBaseView

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  memset(&v31, 0, sizeof(v31));
  if (a6 == 1)
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v31.c = v16;
    *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v9)
    {
LABEL_5:
      v13 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v30.c = v14;
      *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransform v29 = v31;
      CGAffineTransform v28 = v31;
      v15 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a6) {
      CGAffineTransformMakeScale(&v31, 0.9, 0.9);
    }
    if (v9) {
      goto LABEL_5;
    }
  }
  CGAffineTransform v30 = v31;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v29.c = v17;
  *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v28.a = *(_OWORD *)&v29.a;
  *(_OWORD *)&v28.c = v17;
  *(_OWORD *)&v28.tx = *(_OWORD *)&v29.tx;
  v13 = &v31;
  v15 = v11;
LABEL_8:
  long long v18 = *(_OWORD *)&v13->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&v13->a;
  *(_OWORD *)&v27.c = v18;
  *(_OWORD *)&v27.tx = *(_OWORD *)&v13->tx;
  id v19 = v15;
  if (a6 == 1) {
    CDTemplicateComplicationShouldPerformFullFade();
  }
  CLKCompressFraction();
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");
  CGAffineTransform v23 = v30;
  CGAffineTransform v22 = v28;
  CLKInterpolateBetweenTransform();
  v21[0] = v24;
  v21[1] = v25;
  v21[2] = v26;
  [v11 setTransform:v21];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");
  CGAffineTransform v23 = v29;
  CGAffineTransform v22 = v27;
  CLKInterpolateBetweenTransform();
  v20[0] = v20[3];
  v20[1] = v20[4];
  v20[2] = v20[5];
  [v12 setTransform:v20];
}

+ (id)keylineImageWithFilled:(BOOL)a3 forDevice:(id)a4
{
  return (id)[a1 keylineImageWithFilled:a3 wide:0 expanded:0 forDevice:a4];
}

+ (id)keylineImageWithFilled:(BOOL)a3 wide:(BOOL)a4 expanded:(BOOL)a5 forDevice:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_2;
  aBlock[3] = &unk_1E62C6E18;
  id v27 = &__block_literal_global_122;
  id v10 = v9;
  id v26 = v10;
  id v11 = _Block_copy(aBlock);
  os_unfair_lock_lock((os_unfair_lock_t)&keylineImageWithFilled_wide_expanded_forDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&keylineImageWithFilled_wide_expanded_forDevice____cachedDevice);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    id v14 = objc_loadWeakRetained(&keylineImageWithFilled_wide_expanded_forDevice____cachedDevice);
    if (v14 == v10)
    {
      uint64_t v15 = [v10 version];
      uint64_t v16 = keylineImageWithFilled_wide_expanded_forDevice____previousCLKDeviceVersion;

      if (v15 == v16) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v17 = objc_storeWeak(&keylineImageWithFilled_wide_expanded_forDevice____cachedDevice, v10);
  keylineImageWithFilled_wide_expanded_forDevice____previousCLKDeviceVersion = [v10 version];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_5;
  v23[3] = &unk_1E62C6E40;
  id v24 = v11;
  __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_5((uint64_t)v23);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&keylineImageWithFilled_wide_expanded_forDevice____lock);
  long long v18 = (void *)keylineImageWithFilled_wide_expanded_forDevice__images;
  v20 = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke(v19, v8, v7, v6);
  v21 = [v18 objectForKeyedSubscript:v20];

  return v21;
}

id __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v6 = NSString;
  BOOL v7 = [NSNumber numberWithBool:a2];
  BOOL v8 = [NSNumber numberWithBool:a3];
  id v9 = [NSNumber numberWithBool:a4];
  id v10 = [v6 stringWithFormat:@"%@-%@-%@", v7, v8, v9];

  return v10;
}

void __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  BOOL v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  double v10 = NTKWhistlerSubdialComplicationDiameter(*(void *)(a1 + 32));
  double v11 = v10 * 1.4;
  if (!a2) {
    double v11 = v10;
  }
  if (a3) {
    double v12 = v10 * 1.15;
  }
  else {
    double v12 = v10;
  }
  if (a3) {
    double v13 = v11 * 1.15;
  }
  else {
    double v13 = v11;
  }
  id v14 = (void *)MEMORY[0x1C1875BE0]();
  uint64_t v15 = [MEMORY[0x1E4FB17E0] preferredFormat];
  [*(id *)(a1 + 32) screenScale];
  objc_msgSend(v15, "setScale:");
  [v15 setPreferredRange:0];
  [v15 setOpaque:0];
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v15, v13, v12);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_3;
  v20[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v20[4] = v13;
  *(double *)&v20[5] = v12;
  id v17 = [v16 imageWithActions:v20];
  if (v17) {
    [v7 setObject:v17 forKeyedSubscript:v8];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_4;
  v19[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v19[4] = v13;
  *(double *)&v19[5] = v12;
  long long v18 = [v16 imageWithActions:v19];
  if (v18) {
    [v7 setObject:v18 forKeyedSubscript:v9];
  }
}

void __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_3(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 40) * 0.5);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [MEMORY[0x1E4FB1618] whiteColor];
  [v1 setFill];

  [v2 fill];
}

void __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_4(uint64_t a1)
{
  double v2 = NTKKeylineWidth();
  v6.size.width = *(CGFloat *)(a1 + 32);
  v6.size.height = *(CGFloat *)(a1 + 40);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  CGRect v7 = CGRectInset(v6, v2, v2);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height, *(double *)(a1 + 40) * 0.5);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setStroke];

  [v4 setLineWidth:v2];
  [v4 stroke];
}

uint64_t __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  v3 = (void *)keylineImageWithFilled_wide_expanded_forDevice__images;
  keylineImageWithFilled_wide_expanded_forDevice__images = v2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

+ (id)keylineViewForDevice:(id)a3
{
  return (id)[a1 keylineViewForDevice:a3 wide:0 expanded:0];
}

+ (id)keylineViewForDevice:(id)a3 wide:(BOOL)a4 expanded:(BOOL)a5
{
  v5 = [a1 keylineImageWithFilled:0 wide:a4 expanded:a5 forDevice:a3];
  CGRect v6 = v5;
  if (v5)
  {
    CGRect v7 = NTKKeylineViewWithImage(v5);
  }
  else
  {
    CGRect v7 = 0;
  }

  return v7;
}

+ (id)layoutRuleForState:(int64_t)a3 viewCenterInFaceBounds:(CGPoint)a4 position:(int64_t)a5 forDevice:(id)a6
{
  return (id)objc_msgSend(a1, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a3, a5, 0, 0, a6, a4.x, a4.y);
}

+ (id)layoutRuleForState:(int64_t)a3 viewCenterInFaceBounds:(CGPoint)a4 position:(int64_t)a5 editingAdjustment:(int64_t)a6 wide:(BOOL)a7 forDevice:(id)a8
{
  BOOL v8 = a7;
  double y = a4.y;
  double x = a4.x;
  id v15 = a8;
  double v16 = _LayoutConstants_36(v15);
  double v17 = NTKWhistlerSubdialComplicationDiameter(v15);
  if (v8) {
    double v18 = v17 * 1.4;
  }
  else {
    double v18 = v17;
  }
  double v19 = x - v18 * 0.5;
  double v20 = y - v17 * 0.5;
  if (a6 == 1) {
    double v21 = -1.9;
  }
  else {
    double v21 = 1.0;
  }
  double v22 = -1.0;
  if (a6 != 1) {
    double v22 = 1.0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    switch(a5)
    {
      case 0:
        double v19 = v19 + v22 * v16;
        break;
      case 1:
        double v19 = v19 - v22 * v16;
        break;
      case 2:
        double v20 = v20 - v22 * v16;
        break;
      case 3:
        double v20 = v20 + v21 * v16;
        break;
      default:
        break;
    }
  }
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v34 = *MEMORY[0x1E4F1DAB8];
  long long v35 = v23;
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v25 = *MEMORY[0x1E4FB2848];
  double v24 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v27 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v26 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (a6)
  {
    if (a6 == 1)
    {
      CGAffineTransform v28 = [a1 keylineImageWithFilled:0 wide:v8 expanded:1 forDevice:v15];
      [v28 size];
      double v26 = (v29 - v18) * 0.5;
      [v28 size];
      double v27 = (v30 - v17) * 0.5;

      double v24 = v26;
      double v25 = v27;
    }
  }
  else
  {
    [a1 transformForState:a3];
  }
  v33[0] = v34;
  v33[1] = v35;
  v33[2] = v36;
  CGAffineTransform v31 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:", v15, 3, 3, 0, v33, v19, v20, v18, v17, v25, v24, v27, v26);

  return v31;
}

+ (CGAffineTransform)transformForState:(SEL)a3
{
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return CGAffineTransformMakeScale(retstr, 0.9, 0.9);
  }
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v4 + 32);
  return result;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [[NTKRichComplicationCircularBaseView alloc] initWithFamily:10];
    [(NTKRichComplicationCircularBaseView *)v3 setHidden:1];
  }
  return v3;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (NTKRichComplicationCircularBaseView)initWithFamily:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationCircularBaseView;
  v3 = [(CDRichComplicationView *)&v13 initWithFamily:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKRichComplicationCircularBaseView *)v3 setBackgroundColor:v4];

    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
    platterColor = v3->_platterColor;
    v3->_platterColor = (UIColor *)v5;

    CGRect v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    framingView = v3->_framingView;
    v3->_framingView = v7;

    [(UIView *)v3->_framingView setBackgroundColor:v3->_platterColor];
    [(NTKRichComplicationCircularBaseView *)v3 addSubview:v3->_framingView];
    id v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v3->_contentView;
    v3->_contentView = v9;

    double v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v3->_contentView setBackgroundColor:v11];

    [(UIView *)v3->_framingView addSubview:v3->_contentView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)NTKRichComplicationCircularBaseView;
  [(NTKRichComplicationCircularBaseView *)&v33 layoutSubviews];
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E4F1DAB8];
  long long v26 = *(_OWORD *)&v32.a;
  *(_OWORD *)&v32.c = v25;
  *(_OWORD *)&v32.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v24 = *(_OWORD *)&v32.tx;
  v31[0] = *(_OWORD *)&v32.a;
  v31[1] = v25;
  v31[2] = *(_OWORD *)&v32.tx;
  [(UIView *)self->_framingView setTransform:v31];
  [(NTKRichComplicationCircularBaseView *)self bounds];
  [(NTKRichComplicationCircularBaseView *)self bounds];
  [(NTKRichComplicationCircularBaseView *)self bounds];
  v3 = [(CDRichComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  -[UIView setFrame:](self->_framingView, "setFrame:");

  [(NTKRichComplicationCircularBaseView *)self bounds];
  double v5 = v4 * 0.5;
  CGRect v6 = [(UIView *)self->_framingView layer];
  [v6 setCornerRadius:v5];

  [(UIView *)self->_framingView bounds];
  [(NTKRichComplicationCircularBaseView *)self _contentDiameter];
  double v8 = v7;
  id v9 = [(CDRichComplicationView *)self device];
  CLKSizeCenteredInRectForDevice();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [(CDRichComplicationView *)self device];
  _LayoutConstants_36(v18);
  double v20 = v19;

  v30[0] = v26;
  v30[1] = v25;
  v30[2] = v24;
  [(UIView *)self->_contentView setTransform:v30];
  -[UIView setFrame:](self->_contentView, "setFrame:", v11, v13, v15, v17);
  double v21 = [(UIView *)self->_contentView layer];
  [v21 setCornerRadius:v8 * 0.5];

  switch([(NTKRichComplicationCircularBaseView *)self position])
  {
    case 0:
      double v22 = v20;
      goto LABEL_5;
    case 1:
      double v22 = -v20;
LABEL_5:
      double v20 = 0.0;
      break;
    case 2:
      double v20 = -v20;
      goto LABEL_7;
    case 3:
LABEL_7:
      double v22 = 0.0;
      break;
    default:
      double v22 = *MEMORY[0x1E4F1DAD8];
      double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  *(_OWORD *)&v29.a = v26;
  *(_OWORD *)&v29.c = v25;
  *(_OWORD *)&v29.tdouble x = v24;
  CGAffineTransformTranslate(&v32, &v29, v22, v20);
  CLKDegreesToRadians();
  CGAffineTransform v28 = v32;
  CGAffineTransformRotate(&v29, &v28, v23);
  CGAffineTransform v32 = v29;
  CGAffineTransform v28 = v29;
  CGAffineTransformTranslate(&v29, &v28, -v22, -v20);
  CGAffineTransform v32 = v29;
  CGAffineTransform v27 = v29;
  [(UIView *)self->_framingView setTransform:&v27];
}

- (void)makeBackgroundTransparent
{
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)self->_framingView setBackgroundColor:v3];
  [(UIView *)self->_contentView setBackgroundColor:v3];
}

- (void)setPlatterColor:(id)a3
{
  p_platterColor = &self->_platterColor;
  objc_storeStrong((id *)&self->_platterColor, a3);
  id v6 = a3;
  [(UIView *)self->_framingView setBackgroundColor:*p_platterColor];
}

- (void)setAccentedAlternateBackground:(BOOL)a3
{
  if (self->_accentedAlternateBackground != a3)
  {
    self->_accentedAlternateBackground = a3;
    [(NTKRichComplicationCircularBaseView *)self _updatePlatterColor];
  }
}

- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6
{
  if (!a6) {
    [(NTKRichComplicationCircularBaseView *)self _setWhistlerAnalogEditingTransitonFraction:a4 direction:a5 position:a3];
  }
}

- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  double v7 = fmin(fmax(a3 + -0.5, 0.0), 0.5) * -2.0 + 1.0;
  double v8 = fmax(a3, 0.0);
  if (v8 >= 0.5) {
    double v9 = 1.0;
  }
  else {
    double v9 = v8 + v8;
  }
  if (a5) {
    double v9 = 0.0;
  }
  double v10 = [(CDRichComplicationView *)self device];
  _LayoutConstants_36(v10);

  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1) {
    double v11 = -v11;
  }
  self->_editingRotationInDegree = v11;
  [(NTKRichComplicationCircularBaseView *)self setNeedsLayout];
}

- (void)_editingDidEnd
{
  self->_editingRotationInDegree = 0.0;
}

- (id)_createAndAddColoringLabel
{
  id v3 = objc_opt_new();
  [v3 setUsesLegibility:0];
  [v3 setUppercase:1];
  [v3 setAlpha:1.0];
  double v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setColor:v4];

  [v3 setUsesTextProviderTintColoring:1];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke;
  v9[3] = &unk_1E62C0040;
  objc_copyWeak(&v10, &location);
  [v3 setNowProvider:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke_2;
  v7[3] = &unk_1E62C0068;
  objc_copyWeak(&v8, &location);
  [v3 setNeedsResizeHandler:v7];
  [v3 setFilterProvider:self];
  double v5 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v5 addSubview:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

id __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  id v3 = [WeakRetained complicationDate];

  return v3;
}

void __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
  v1 = [WeakRetained displayObserver];
  [v1 complicationDisplayNeedsResize:WeakRetained];
}

- (unint64_t)_adjustFontSizeForLabel:(id)a3 fontWeight:(double)a4 possibleMaxWidths:(id)a5 possibleFontSizes:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 count];
  if (v13 != [v12 count]) {
    -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:]();
  }
  if (![v12 count]) {
    -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:]();
  }
  if ([v11 count])
  {
    double v14 = 0;
    unint64_t v15 = 0;
    do
    {
      double v16 = [v11 objectAtIndexedSubscript:v15];
      [v16 floatValue];
      float v18 = v17;

      double v19 = [v12 objectAtIndexedSubscript:v15];
      [v19 floatValue];
      double v21 = v20;

      double v22 = [(CDRichComplicationView *)self fontDescriptor];
      CGFloat v23 = (void *)MEMORY[0x1E4F19A50];
      if (v22)
      {
        [(CDRichComplicationView *)self fontSizeFactor];
        [v23 fontWithDescriptor:v22 size:v24 * v21];
      }
      else
      {
        [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v21 design:a4];
      long long v25 = };
      double v26 = v18;
      CGAffineTransform v27 = [v25 CLKFontWithAlternativePunctuation];

      [v10 widthForMaxWidth:v27 withFont:v26];
      double v29 = v28;

      if (v29 <= v26) {
        break;
      }
      ++v15;
      double v14 = v27;
    }
    while (v15 < [v11 count]);
  }
  else
  {
    unint64_t v15 = 0;
    CGAffineTransform v27 = 0;
    double v26 = 0.0;
  }
  [v10 setMaxWidth:v26];
  [v10 setFont:v27];
  [v10 sizeToFit];
  [v10 frame];
  if (v30 > v26) {
    objc_msgSend(v10, "setFrame:");
  }

  return v15;
}

- (double)_contentDiameter
{
  int64_t v3 = [(CDRichComplicationView *)self family];
  double v4 = [(CDRichComplicationView *)self device];
  if (v3 == 12) {
    NTKGraphicExtraLargeComplicationContentDiameter();
  }
  else {
    double v5 = NTKWhistlerSubdialComplicationContentDiameter();
  }
  double v6 = v5;

  return v6;
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v5, v5);
  CGAffineTransform v6 = v7;
  [(NTKRichComplicationCircularBaseView *)self setTransform:&v6];
}

- (void)_updatePlatterColor
{
  if ([(CDRichComplicationTemplateView *)self templateWantsPlatter])
  {
    int64_t v3 = [(CDRichComplicationView *)self filterProvider];
    id v5 = [v3 colorForView:self accented:self->_accentedAlternateBackground];

    if (v5) {
      CLKUIDefaultComplicationBackgroundColorWithNonAccentColor();
    }
    CLKUIDefaultComplicationBackgroundColor();
  }
  id v6 = [(NTKRichComplicationCircularBaseView *)self contentView];
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v4];
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (BOOL)accentedAlternateBackground
{
  return self->_accentedAlternateBackground;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)framingView
{
  return self->_framingView;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (NTKRichComplicationCircularBaseView)init
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return [(NTKRichComplicationCircularBaseView *)self initWithFamily:10];
}

- (void)_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:.cold.1()
{
}

- (void)_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:.cold.2()
{
  __assert_rtn("-[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:]", "NTKRichComplicationCircularBaseView.m", 495, "possibleMaxWidths.count == possibleFontSizes.count");
}

@end