@interface NTKUtilityComplicationFactory
+ (CGPoint)smileShapeAlignmentPointForDevice:(id)a3;
+ (CGSize)smileShapeSizeForDevice:(id)a3;
+ (id)smileShapeForDevice:(id)a3;
+ (unint64_t)placementForSlot:(int64_t)a3;
+ (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(int64_t)a8 forDevice:(id)a9;
- (BOOL)accommodatesTwoTopComplications;
- (BOOL)graphicCornerComplications;
- (BOOL)includesDateComplicationLayoutRules;
- (BOOL)usesNarrowTopSlots;
- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4 faceView:(id)a5;
- (CGSize)normalCircularPadding;
- (CLKDevice)device;
- (CLKFont)topBezelLabelFont;
- (NTKFaceView)faceView;
- (NTKUtilityComplicationFactoryDelegate)delegate;
- (UIEdgeInsets)screenEdgeInsets;
- (double)_maxBottomCenterWidthLeavingRoomForKeylines:(CGRect)a3;
- (double)_maxBottomCornerWidthLeavingRoomForKeylines:(CGRect)a3;
- (double)_maxDateWidthLeavingRoomForKeylines;
- (double)_maxTopCornerWidthLeavingRoomForKeylines:(CGRect)a3;
- (double)_maxWidthForKeylineAndPadding;
- (double)bezelComplicationMaxAngularWidth;
- (double)bezelComplicationRadiusWithDialDiameter:(double)a3;
- (double)bezelKeylineDiameter;
- (double)bezelKeylineInnerCircleOffset;
- (double)bezelLabelMaxWidthInDegree;
- (double)bezelLabelTopPadding;
- (double)crownIndicatorGap;
- (double)dateHorizontalCenterOffset;
- (double)dateKeylineMaxWidth;
- (double)dateVerticalCenterOffset;
- (double)deselectedKeylineCircularInnerPadding;
- (double)deselectedKeylineSideInnerPadding;
- (double)deselectedKeylineVerticalInnerPadding;
- (double)dialDiameter;
- (double)foregroundAlpha;
- (double)foregroundAlphaForEditing:(BOOL)a3;
- (double)foregroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (double)foregroundImageAlpha;
- (double)foregroundImageAlphaForEditing:(BOOL)a3;
- (double)foregroundImageAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (double)maxNormalLongWidth;
- (double)normalSidePadding;
- (double)normalVerticalPadding;
- (double)selectedKeylineHeight;
- (double)selectedKeylineSideInnerPadding;
- (double)selectedKeylineVerticalInnerContentSpacer;
- (id)_curvedImageForSlot:(int64_t)a3 filled:(BOOL)a4;
- (id)_curvedKeylineImageForSlot:(int64_t)a3;
- (id)_curvedMaskImageForSlot:(int64_t)a3;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_viewForDateComplication:(id)a3;
- (id)initForDevice:(id)a3;
- (id)keylineViewForComplicationSlot:(id)a3;
- (id)keylineViewForSlot:(int64_t)a3;
- (id)keylineViewForSlot:(int64_t)a3 dialDiameter:(double)a4;
- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)newViewForComplication:(id)a3 family:(int64_t)a4 forSlot:(int64_t)a5;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (int64_t)bottomCenterLayout;
- (int64_t)complicationPickerStyleForSlot:(id)a3;
- (int64_t)layoutOverrideForComplicationType:(unint64_t)a3 inSlot:(int64_t)a4;
- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)layoutStyleForSlot:(id)a3;
- (void)_configureBottomCenterLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5;
- (void)_configureBottomLeftLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5;
- (void)_configureBottomRightAboveLayout:(id)a3 withBounds:(CGRect)a4;
- (void)_configureBottomRightBelowLayout:(id)a3 withBounds:(CGRect)a4;
- (void)_configureBottomRightLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5;
- (void)_configureBottomRightLongLayout:(id)a3 withBounds:(CGRect)a4;
- (void)_configureDateLayout:(id)a3 withBounds:(CGRect)a4;
- (void)_configureLayout:(id)a3 withNormalSize:(CGSize)a4 editingSize:(CGSize)a5 variant:(BOOL)a6 addCircleOverrides:(BOOL)a7 makeRuleBlock:(id)a8;
- (void)_configureOverridesForLayout:(id)a3 withNormalSize:(CGSize)a4 editingSize:(CGSize)a5 variant:(BOOL)a6 addCircleOverrides:(BOOL)a7 makeRuleBlock:(id)a8;
- (void)_configureTopBezelLayout:(id)a3 withBounds:(CGRect)a4 dialDiameter:(double)a5;
- (void)_configureTopLeftLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5;
- (void)_configureTopRightAboveLayout:(id)a3 withBounds:(CGRect)a4;
- (void)_configureTopRightBelowLayout:(id)a3 withBounds:(CGRect)a4;
- (void)_configureTopRightLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5;
- (void)_configureUpNextTopRightLayout:(id)a3 withBounds:(CGRect)a4;
- (void)configureComplicationLayout:(id)a3 forSlot:(int64_t)a4 bounds:(CGRect)a5 dialDiameter:(double)a6;
- (void)configureComplicationLayout:(id)a3 forSlot:(int64_t)a4 withBounds:(CGRect)a5;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)configureComplicationView:(id)a3 forSlot:(id)a4 dialDiameter:(double)a5;
- (void)curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)loadLayoutRules;
- (void)setAccommodatesTwoTopComplications:(BOOL)a3;
- (void)setBezelKeylineDiameter:(double)a3;
- (void)setBezelKeylineInnerCircleOffset:(double)a3;
- (void)setBezelLabelMaxWidthInDegree:(double)a3;
- (void)setBezelLabelTopPadding:(double)a3;
- (void)setBottomCenterLayout:(int64_t)a3;
- (void)setCrownIndicatorGap:(double)a3;
- (void)setDateHorizontalCenterOffset:(double)a3;
- (void)setDateKeylineMaxWidth:(double)a3;
- (void)setDateVerticalCenterOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDeselectedKeylineCircularInnerPadding:(double)a3;
- (void)setDeselectedKeylineSideInnerPadding:(double)a3;
- (void)setDeselectedKeylineVerticalInnerPadding:(double)a3;
- (void)setDialDiameter:(double)a3;
- (void)setFaceView:(id)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setForegroundImageAlpha:(double)a3;
- (void)setGraphicCornerComplications:(BOOL)a3;
- (void)setIncludesDateComplicationLayoutRules:(BOOL)a3;
- (void)setMaxNormalLongWidth:(double)a3;
- (void)setNormalCircularPadding:(CGSize)a3;
- (void)setNormalSidePadding:(double)a3;
- (void)setNormalVerticalPadding:(double)a3;
- (void)setScreenEdgeInsets:(UIEdgeInsets)a3;
- (void)setSelectedKeylineHeight:(double)a3;
- (void)setSelectedKeylineSideInnerPadding:(double)a3;
- (void)setSelectedKeylineVerticalInnerContentSpacer:(double)a3;
- (void)setTopBezelLabelFont:(id)a3;
- (void)setUsesNarrowTopSlots:(BOOL)a3;
@end

@implementation NTKUtilityComplicationFactory

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NTKUtilityComplicationFactory;
  v6 = [(NTKUtilityComplicationFactory *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    *(_WORD *)&v7->_graphicCornerComplications = 0;
    memset(v37, 0, sizeof(v37));
    long long v35 = 0u;
    long long v36 = 0u;
    memset(v34, 0, sizeof(v34));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    _LayoutConstants_2(v7->_device, &v24);
    v7->_accommodatesTwoTopComplications = 1;
    long long v8 = *(_OWORD *)&v34[1];
    v7->_normalCircularPadding = *(CGSize *)&v37[1];
    *(_OWORD *)&v7->_normalSidePadding = v8;
    *(_OWORD *)&v7->_deselectedKeylineSideInnerPadding = xmmword_1BC8A0340;
    *(_OWORD *)&v7->_deselectedKeylineCircularInnerPadding = xmmword_1BC8A0350;
    v7->_selectedKeylineVerticalInnerContentSpacer = 2.0;
    CLKValueForDeviceMetrics();
    v7->_selectedKeylineHeight = v9;
    v7->_foregroundAlpha = NTKUtilityComplicationNormalForegroundAlpha();
    double v10 = NTKUtilityComplicationNormalForegroundAlpha();
    v11 = (_OWORD *)MEMORY[0x1E4FB2848];
    double v12 = *(double *)&v26;
    double v13 = *(double *)&v25;
    v7->_foregroundImageAlpha = v10;
    v7->_maxNormalLongWidth = v12;
    long long v14 = v11[1];
    *(_OWORD *)&v7->_screenEdgeInsets.top = *v11;
    v7->_bottomCenterLayout = 1;
    *(_OWORD *)&v7->_screenEdgeInsets.bottom = v14;
    v7->_crownIndicatorGap = v13;
    double v15 = *((double *)&v35 + 1);
    *(void *)&v7->_bezelLabelTopPadding = v34[3];
    v16 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:v15 design:*MEMORY[0x1E4FB09D0]];
    uint64_t v17 = [v16 CLKFontWithAlternativePunctuation];
    topBezelLabelFont = v7->_topBezelLabelFont;
    v7->_topBezelLabelFont = (CLKFont *)v17;

    *(void *)&v7->_bezelKeylineInnerCircleOffset = v36;
    [v5 screenBounds];
    double v20 = v19;
    _LayoutConstants_2(v7->_device, v22);
    v7->_bezelKeylineDiameter = v20 - v23;
  }

  return v7;
}

+ (unint64_t)placementForSlot:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0xB) {
    return 3;
  }
  else {
    return qword_1BC8A0408[a3 - 2];
  }
}

+ (id)smileShapeForDevice:(id)a3
{
  double v12 = 0.0;
  double v13 = 0.0;
  id v3 = a3;
  _LayoutConstants_2(v3, v10);
  double v4 = v11;
  _LayoutConstants_2(v3, v8);
  double v5 = v9;
  +[NTKUtilityComplicationFactory curvedCircleRadius:&v13 centerAngle:0 maxAngularWidth:&v12 circleCenter:0 interior:0 forSlot:10 forDevice:v3];
  v6 = [off_1E62BD5F8 smileShapeWithDevice:v3 outerRadius:0 innerRadius:v5 + v13 angle:v13 - v4 strokeWidth:v12 * 0.5 filled:NTKKeylineWidth()];

  return v6;
}

+ (CGSize)smileShapeSizeForDevice:(id)a3
{
  double v17 = 0.0;
  double v18 = 0.0;
  id v3 = a3;
  _LayoutConstants_2(v3, v15);
  double v4 = v16;
  _LayoutConstants_2(v3, v13);
  double v5 = v14;
  +[NTKUtilityComplicationFactory curvedCircleRadius:&v18 centerAngle:0 maxAngularWidth:&v17 circleCenter:0 interior:0 forSlot:10 forDevice:v3];

  double v6 = v5 + v18;
  double v7 = v18 - v4;
  double v8 = (v6 - (v18 - v4)) * 0.5;
  double v9 = (v6 + v7) * 0.5;
  __double2 v10 = __sincos_stret(1.57079633 - v17 * 0.5);
  double v11 = v8 + v9 * v10.__cosval + v8 + v9 * v10.__cosval;
  double v12 = v6 - -(v8 - v9 * v10.__sinval);
  result.height = v12;
  result.width = v11;
  return result;
}

+ (CGPoint)smileShapeAlignmentPointForDevice:(id)a3
{
  id v3 = a3;
  _LayoutConstants_2(v3, v11);
  double v4 = v12;
  +[NTKUtilityComplicationFactory smileShapeSizeForDevice:v3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6 * 0.5;
  double v10 = v8 - v4;
  result.y = v10;
  result.x = v9;
  return result;
}

- (int64_t)layoutOverrideForComplicationType:(unint64_t)a3 inSlot:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 3) {
    return 0;
  }
  double v5 = NTKUtilityComplicationCircularTypes();
  LODWORD(a3) = [v5 containsIndex:a3];

  if (a3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)newViewForComplication:(id)a3 family:(int64_t)a4 forSlot:(int64_t)a5
{
  id v8 = a3;
  double v9 = v8;
  if (a5 != 12)
  {
    if ((unint64_t)(a5 - 7) <= 4)
    {
      uint64_t v10 = +[NTKUtilityComplicationView largeComplicationViewForType:narrow:](NTKUtilityComplicationView, "largeComplicationViewForType:narrow:", [v8 complicationType], a4 == 104);
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v10 = +[NTKUtilityComplicationView smallComplicationViewForType:](NTKUtilityComplicationView, "smallComplicationViewForType:", [v9 complicationType]);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v10 = [(NTKUtilityComplicationFactory *)self _viewForDateComplication:v9];
LABEL_7:
  double v11 = (void *)v10;

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 dialDiameter:(double)a5
{
  id v11 = a3;
  if ([a4 isEqualToString:@"bezel"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v11;
      double v9 = [(NTKUtilityComplicationFactory *)self device];
      _LayoutConstants_2(v9, v12);
      [v8 setFontSize:v13];

      [v8 setFontWeight:*MEMORY[0x1E4FB09D0]];
      [v8 setUseRoundedFontDesign:1];
      objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", 11));
      [(NTKUtilityComplicationFactory *)self bezelComplicationMaxAngularWidth];
      objc_msgSend(v8, "setMaxAngularWidth:");
      [(NTKUtilityComplicationFactory *)self bezelComplicationRadiusWithDialDiameter:a5];
      objc_msgSend(v8, "setCircleRadius:");
      uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
      [v8 setForegroundColor:v10];

      [v8 setForegroundAlpha:1.0];
      [v8 setShouldScaleAndFadeWhenHighlighting:1];
    }
  }
}

- (double)bezelComplicationRadiusWithDialDiameter:(double)a3
{
  [(CLKFont *)self->_topBezelLabelFont capHeight];
  double v4 = [(NTKUtilityComplicationFactory *)self device];
  CLKRoundForDevice();
  double v6 = v5;

  return v6;
}

- (double)bezelComplicationMaxAngularWidth
{
  v2 = [(NTKUtilityComplicationFactory *)self device];
  double v3 = NTKWhistlerBezelCircularViewDefaultMaxAngularWidth();

  return v3;
}

- (void)configureComplicationLayout:(id)a3 forSlot:(int64_t)a4 withBounds:(CGRect)a5
{
}

- (void)configureComplicationLayout:(id)a3 forSlot:(int64_t)a4 bounds:(CGRect)a5 dialDiameter:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  double v13 = [(NTKUtilityComplicationFactory *)self delegate];
  uint64_t v14 = [v13 textLayoutStyleForSlot:a4];

  switch(a4)
  {
    case 1:
      -[NTKUtilityComplicationFactory _configureTopLeftLayout:withBounds:variant:](self, "_configureTopLeftLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 2:
      -[NTKUtilityComplicationFactory _configureTopRightLayout:withBounds:variant:](self, "_configureTopRightLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 3:
      -[NTKUtilityComplicationFactory _configureBottomLeftLayout:withBounds:variant:](self, "_configureBottomLeftLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 4:
      -[NTKUtilityComplicationFactory _configureBottomRightLayout:withBounds:variant:](self, "_configureBottomRightLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 5:
      -[NTKUtilityComplicationFactory _configureTopRightAboveLayout:withBounds:](self, "_configureTopRightAboveLayout:withBounds:", v15, x, y, width, height);
      break;
    case 6:
      -[NTKUtilityComplicationFactory _configureBottomRightAboveLayout:withBounds:](self, "_configureBottomRightAboveLayout:withBounds:", v15, x, y, width, height);
      break;
    case 7:
      -[NTKUtilityComplicationFactory _configureTopRightBelowLayout:withBounds:](self, "_configureTopRightBelowLayout:withBounds:", v15, x, y, width, height);
      break;
    case 8:
      -[NTKUtilityComplicationFactory _configureBottomRightBelowLayout:withBounds:](self, "_configureBottomRightBelowLayout:withBounds:", v15, x, y, width, height);
      break;
    case 9:
      -[NTKUtilityComplicationFactory _configureBottomRightLongLayout:withBounds:](self, "_configureBottomRightLongLayout:withBounds:", v15, x, y, width, height);
      break;
    case 10:
      -[NTKUtilityComplicationFactory _configureBottomCenterLayout:withBounds:variant:](self, "_configureBottomCenterLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 11:
      -[NTKUtilityComplicationFactory _configureTopBezelLayout:withBounds:dialDiameter:](self, "_configureTopBezelLayout:withBounds:dialDiameter:", v15, x, y, width, height, a6);
      break;
    case 12:
      -[NTKUtilityComplicationFactory _configureDateLayout:withBounds:](self, "_configureDateLayout:withBounds:", v15, x, y, width, height);
      break;
    case 13:
      -[NTKUtilityComplicationFactory _configureUpNextTopRightLayout:withBounds:](self, "_configureUpNextTopRightLayout:withBounds:", v15, x, y, width, height);
      break;
    default:
      break;
  }
}

- (id)_curvedKeylineImageForSlot:(int64_t)a3
{
  return [(NTKUtilityComplicationFactory *)self _curvedImageForSlot:a3 filled:0];
}

- (id)_curvedMaskImageForSlot:(int64_t)a3
{
  return [(NTKUtilityComplicationFactory *)self _curvedImageForSlot:a3 filled:1];
}

- (id)_curvedImageForSlot:(int64_t)a3 filled:(BOOL)a4
{
  BOOL v4 = a4;
  v21[4] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) < 4)
  {
    v20[0] = &unk_1F16E0660;
    v20[1] = &unk_1F16E0690;
    v21[0] = &unk_1F16E0678;
    v21[1] = &unk_1F16E06A8;
    v20[2] = &unk_1F16E06C0;
    v20[3] = &unk_1F16E06F0;
    v21[2] = &unk_1F16E06D8;
    v21[3] = &unk_1F16E0708;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
    [(NTKUtilityComplicationFactory *)self device];
    objc_claimAutoreleasedReturnValue();
    [NSNumber numberWithInteger:a3];
    [v7 objectForKeyedSubscript:objc_claimAutoreleasedReturnValue()];
    [(id)objc_claimAutoreleasedReturnValue() intValue];
    [(NTKUtilityComplicationFactory *)self device];
    objc_claimAutoreleasedReturnValue();
    CDCornerComplicationKeylineSize();
  }
  if (a3 == 10)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    _LayoutConstants_2(self->_device, v16);
    double v9 = v17;
    _LayoutConstants_2(self->_device, v14);
    double v10 = v15;
    +[NTKUtilityComplicationFactory curvedCircleRadius:&v19 centerAngle:0 maxAngularWidth:&v18 circleCenter:0 interior:0 forSlot:10 forDevice:self->_device];
    id v11 = [(NTKUtilityComplicationFactory *)self device];
    double v12 = [off_1E62BD5F8 smileKeylineWithDevice:v11 outerRadius:v4 innerRadius:v10 + v19 angle:v19 - v9 strokeWidth:v18 * 0.5 filled:NTKKeylineWidth()];
  }
  else
  {
    if (a3 == 11)
    {
      if (a4)
      {
        id v8 = [@"utility_bezel_keyline" stringByAppendingString:@"_filled"];
      }
      else
      {
        id v8 = @"utility_bezel_keyline";
      }
      NTKImageNamed(v8);
    }
    double v12 = 0;
  }
  return v12;
}

- (id)keylineViewForSlot:(int64_t)a3
{
  return [(NTKUtilityComplicationFactory *)self keylineViewForSlot:a3 dialDiameter:self->_bezelKeylineDiameter];
}

- (id)keylineViewForSlot:(int64_t)a3 dialDiameter:(double)a4
{
  double v7 = [(NTKUtilityComplicationFactory *)self delegate];
  uint64_t v8 = [v7 textLayoutStyleForSlot:a3];

  if (v8 == 1)
  {
    double v9 = [(NTKUtilityComplicationFactory *)self _curvedKeylineImageForSlot:a3];
    double v10 = NTKKeylineViewWithImage(v9);

    if (a3 == 10)
    {
      double v34 = 0.0;
      long long v33 = 0uLL;
      char v32 = 0;
      +[NTKUtilityComplicationFactory curvedCircleRadius:&v34 centerAngle:0 maxAngularWidth:0 circleCenter:&v33 interior:&v32 forSlot:10 forDevice:self->_device];
      _LayoutConstants_2(self->_device, v30);
      double v11 = v34;
      long double v12 = asin(v31 / (v11 + v11));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __65__NTKUtilityComplicationFactory_keylineViewForSlot_dialDiameter___block_invoke;
      v22[3] = &__block_descriptor_105_e58_B40__0_CGPoint_dd_8__UIView_NTKKeylineView__24__UIEvent_32l;
      long long v23 = v33;
      double v24 = v11;
      char v29 = v32;
      uint64_t v25 = 0x3FF921FB54442D18;
      long double v26 = v12;
      long long v27 = xmmword_1BC8A03E8;
      long long v28 = unk_1BC8A03F8;
      double v13 = +[NTKKeylineTouchable touchableWithHandler:v22];
      [v10 setTouchable:v13];

      goto LABEL_10;
    }
  }
  else
  {
    double v10 = 0;
  }
  if (a3 == 12)
  {
    _LayoutConstants_2(self->_device, v20);
    uint64_t v17 = NTKKeylineViewWithContinuousCurveCornerRadius(v21);
  }
  else
  {
    if (a3 != 11) {
      goto LABEL_10;
    }
    uint64_t v14 = [(NTKUtilityComplicationFactory *)self faceView];
    [v14 _faceEditingScaleForEditMode:1 slot:0];
    double v16 = v15;

    uint64_t v17 = NTKKeylineViewWithWheelShapedPath(a4, a4 - self->_bezelKeylineInnerCircleOffset, v16);
  }
  double v18 = (void *)v17;

  double v10 = v18;
LABEL_10:
  return v10;
}

BOOL __65__NTKUtilityComplicationFactory_keylineViewForSlot_dialDiameter___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  objc_msgSend(a2, "convertPoint:fromView:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  return NTKUtilityComplicationCurvedPointInside(*(unsigned __int8 *)(a1 + 104), a3, a4, *(double *)(a1 + 48), v7, v8, *(double *)(a1 + 56) + *(double *)(a1 + 64), *(double *)(a1 + 56) - *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4 faceView:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 isEqualToString:@"top-left"])
  {
    uint64_t v10 = 0;
  }
  else if ([v8 isEqualToString:@"top-right"])
  {
    uint64_t v10 = 1;
  }
  else if ([v8 isEqualToString:@"bottom-left"])
  {
    uint64_t v10 = 2;
  }
  else
  {
    if (([v8 isEqualToString:@"bottom-right"] & 1) == 0)
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_13;
    }
    uint64_t v10 = 3;
  }
  if (v6) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 2;
  }
  [v9 bounds];
  long double v12 = +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", v11, v10, self->_device, self->_usesNarrowTopSlots);
  [v12 referenceFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [v12 keylinePadding];
  double v24 = v14 - v23;
  double v26 = v16 - v25;
  double v27 = v18 - (-v22 - v23);
  double v28 = v20 - (-v21 - v25);
  char v29 = [v9 _complicationContainerViewForSlot:v8];
  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v29, v24, v26, v27, v28);
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;

  objc_super v38 = [MEMORY[0x1E4F19A30] currentDevice];
  [v38 screenBounds];
  double v40 = v39;

  [v9 faceViewFrameForEditMode:1 option:0 slot:v8];
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGAffineTransformMakeScale(&v54, v45 / v40, v45 / v40);
  v55.origin.CGFloat x = v31;
  v55.origin.CGFloat y = v33;
  v55.size.CGFloat width = v35;
  v55.size.CGFloat height = v37;
  CGRect v56 = CGRectApplyAffineTransform(v55, &v54);
  CGRect v57 = CGRectOffset(v56, v42, v44);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat width = v57.size.width;
  CGFloat height = v57.size.height;

LABEL_13:
  double v50 = x;
  double v51 = y;
  double v52 = width;
  double v53 = height;
  result.size.CGFloat height = v53;
  result.size.CGFloat width = v52;
  result.origin.CGFloat y = v51;
  result.origin.CGFloat x = v50;
  return result;
}

+ (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(int64_t)a8 forDevice:(id)a9
{
  id v24 = a9;
  unint64_t v15 = +[NTKUtilityComplicationFactory placementForSlot:a8];
  +[NTKUtilityFlatComplicationView circleRadius:a3 centerAngle:a4 maxAngularWidth:a5 interior:a7 forPlacement:v15 forDevice:v24];
  if (v15)
  {
    double v17 = NTKUtilityComplicationCurvedUpperOffset(v24);
  }
  else
  {
    double v16 = NTKUtilityComplicationCurvedLowerOffset(v24);
    _LayoutConstants_2(v24, v25);
    double v17 = v16 + v26;
  }
  [v24 screenBounds];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  double MaxY = CGRectGetMaxY(v28);
  if (a6)
  {
    CGFloat v23 = MaxY - (v17 + *a3);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    a6->CGFloat x = CGRectGetMidX(v29);
    a6->CGFloat y = v23;
  }
}

- (double)foregroundAlphaForEditing:(BOOL)a3
{
  if (a3) {
    return NTKUtilityComplicationEditingForegroundAlpha();
  }
  else {
    return self->_foregroundAlpha;
  }
}

- (double)foregroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  [(NTKUtilityComplicationFactory *)self foregroundAlphaForEditing:a4 != 0];
  [(NTKUtilityComplicationFactory *)self foregroundAlphaForEditing:a5 != 0];
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (double)foregroundImageAlphaForEditing:(BOOL)a3
{
  if (a3) {
    return NTKUtilityComplicationEditingForegroundAlpha();
  }
  else {
    return self->_foregroundImageAlpha;
  }
}

- (double)foregroundImageAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  [(NTKUtilityComplicationFactory *)self foregroundImageAlphaForEditing:a4 != 0];
  [(NTKUtilityComplicationFactory *)self foregroundImageAlphaForEditing:a5 != 0];
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (id)_viewForDateComplication:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(NTKUtilityDateComplicationView);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = [v4 dateStyle];

  id v8 = [WeakRetained utilityDateComplicationFontForDateStyle:v7];
  [(NTKUtilityDateComplicationView *)v5 setFont:v8];

  return v5;
}

- (void)_configureTopLeftLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  double top = self->_screenEdgeInsets.top;
  double left = self->_screenEdgeInsets.left;
  double v14 = x + left;
  double v15 = y + top;
  double v16 = width - (left + self->_screenEdgeInsets.right);
  double v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  double v26 = width;
  double v25 = y;
  if (v5)
  {
    double v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    double v21 = v20;
    double v27 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v36);
    double v19 = v37;
    double v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    double v27 = v22;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E62C1460;
  BOOL v35 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = v15;
  *(double *)&aBlock[7] = v16;
  *(double *)&aBlock[8] = v17;
  CGFloat v23 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke_2;
    v28[3] = &unk_1E62C0BD8;
    double v30 = x;
    double v31 = v25;
    double v32 = v26;
    double v33 = height;
    v28[4] = self;
    id v24 = v11;
    id v29 = v24;
    NTKEnumerateComplicationStates(v28);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v24, v5, 1, v23, v19, v21, v27, v21);
  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v23, v19, v21, v27, v21);
  }
}

id __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    double v11 = a6;
    double v12 = a5;
    double v13 = a6;
    double v14 = a5;
    if (!*(unsigned char *)(a1 + 72)) {
      goto LABEL_4;
    }
    double v15 = [*(id *)(a1 + 32) _curvedKeylineImageForSlot:1];
    [v15 size];
    double v17 = v16;
    double v19 = v18;

    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v32);
    double v11 = v34 + a6;
    double v12 = v33 + a5;
    double v13 = v19 - (a4 + a6 + v34);
    double v14 = v17 - (a3 + a5 + v33);
    double v20 = 0.0;
    if (!*(unsigned char *)(a1 + 72))
    {
LABEL_4:
      _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v30);
      double v20 = v31;
    }
  }
  else
  {
    double v11 = *MEMORY[0x1E4FB2848];
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v20 = 0.0;
  }
  double v21 = CGRectGetMinX(*(CGRect *)(a1 + 40)) + a5;
  double v22 = v20 + CGRectGetMinY(*(CGRect *)(a1 + 40)) + a6;
  if (a2 && *(unsigned char *)(a1 + 72))
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v27);
    double v21 = v21 + v28;
    double v22 = v22 + v29;
  }
  BOOL v23 = *(unsigned char *)(a1 + 72) == 0;
  uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v24, 0, v23, 1, v21, v22, a3, a4, v11, v12, v13, v14);
}

void __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 0, *(void *)(*(void *)(a1 + 32) + 16), *(unsigned __int8 *)(*(void *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setDefaultLayoutRule:v4 forState:a2];
}

- (void)_configureTopRightLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  double top = self->_screenEdgeInsets.top;
  double left = self->_screenEdgeInsets.left;
  double v14 = x + left;
  double v15 = y + top;
  double v16 = width - (left + self->_screenEdgeInsets.right);
  double v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  double v27 = width;
  double v26 = y;
  if (v5)
  {
    double v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    double v21 = v20;
    double v28 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v37);
    double v19 = v38;
    double v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    double v28 = v22;
  }
  double crownIndicatorGap = self->_crownIndicatorGap;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E62C1488;
  BOOL v36 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = crownIndicatorGap;
  *(double *)&aBlock[6] = v14;
  *(double *)&aBlock[7] = v15;
  *(double *)&aBlock[8] = v16;
  *(double *)&void aBlock[9] = v17;
  uint64_t v24 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke_2;
    v29[3] = &unk_1E62C0BD8;
    double v31 = x;
    double v32 = v26;
    double v33 = v27;
    double v34 = height;
    v29[4] = self;
    id v25 = v11;
    id v30 = v25;
    NTKEnumerateComplicationStates(v29);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v25, v5, 1, v24, v19, v21, v28, v21);
  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v24, v19, v21, v28, v21);
  }
}

id __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    double v26 = a6;
    double v11 = a5;
    double v12 = a6;
    double v13 = a5;
    if (!*(unsigned char *)(a1 + 80)) {
      goto LABEL_15;
    }
    double v14 = [*(id *)(a1 + 32) _curvedKeylineImageForSlot:2];
    [v14 size];
    double v16 = v15;
    double v18 = v17;

    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v33);
    double v26 = v35 + a6;
    double v11 = v16 - (a3 + a5 + v34);
    double v12 = v18 - (a4 + a6 + v35);
    double v13 = v34 + a5;
    double v19 = 0.0;
    double v20 = 0.0;
    if (!*(unsigned char *)(a1 + 80))
    {
LABEL_15:
      _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v31);
      double v19 = v32;
      double v20 = 0.0;
      if (!*(unsigned char *)(a1 + 80)) {
        double v20 = *(double *)(a1 + 40);
      }
    }
  }
  else
  {
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v26 = *MEMORY[0x1E4FB2848];
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v19 = 0.0;
    double v20 = 0.0;
  }
  double v21 = CGRectGetMaxX(*(CGRect *)(a1 + 48)) - a5 - v20 - a3;
  double v22 = v19 + CGRectGetMinY(*(CGRect *)(a1 + 48)) + a6;
  if (a2 && *(unsigned char *)(a1 + 80))
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v28);
    double v21 = v21 - v29;
    double v22 = v22 + v30;
  }
  BOOL v23 = *(unsigned char *)(a1 + 80) == 0;
  uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v24, 3, v23, 1, v21, v22, a3, a4, v26, v11, v12, v13);
}

void __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 1, *(void *)(*(void *)(a1 + 32) + 16), *(unsigned __int8 *)(*(void *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setDefaultLayoutRule:v4 forState:a2];
}

- (void)_configureBottomLeftLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  double top = self->_screenEdgeInsets.top;
  double left = self->_screenEdgeInsets.left;
  double v14 = x + left;
  double v15 = y + top;
  double v16 = width - (left + self->_screenEdgeInsets.right);
  double v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  double v26 = width;
  double v25 = y;
  if (v5)
  {
    double v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    double v21 = v20;
    double v27 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v36);
    double v19 = v37;
    double v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxBottomCornerWidthLeavingRoomForKeylines:](self, "_maxBottomCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    double v27 = v22;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E62C1460;
  BOOL v35 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = v15;
  *(double *)&aBlock[7] = v16;
  *(double *)&aBlock[8] = v17;
  BOOL v23 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke_2;
    v28[3] = &unk_1E62C0BD8;
    double v30 = x;
    double v31 = v25;
    double v32 = v26;
    double v33 = height;
    v28[4] = self;
    id v24 = v11;
    id v29 = v24;
    NTKEnumerateComplicationStates(v28);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v24, v5, 1, v23, v19, v21, v27, v21);
  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v23, v19, v21, v27, v21);
  }
}

id __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    double v12 = a5;
    double v13 = a6;
    double v14 = a5;
    double v15 = a6;
    if (*(unsigned char *)(a1 + 72))
    {
      double v16 = [*(id *)(a1 + 32) _curvedKeylineImageForSlot:3];
      [v16 size];
      double v18 = v17;
      double v20 = v19;

      _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v27);
      double v15 = v20 - (a4 + a6 + v29);
      double v14 = v28 + a5;
      double v13 = v29 + a6;
      double v12 = v18 - (a3 + a5 + v28);
    }
  }
  else
  {
    double v15 = *MEMORY[0x1E4FB2848];
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v21 = CGRectGetMinX(*(CGRect *)(a1 + 40)) + a5;
  double v22 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  if (a2 && *(unsigned char *)(a1 + 72))
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v26);
    double v21 = v21 + v26[31];
    double v22 = v22 - v26[32];
  }
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v24, 0, v23, 1, v21, v22, a3, a4, v15, v14, v13, v12);
}

void __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 2, *(void *)(*(void *)(a1 + 32) + 16), *(unsigned __int8 *)(*(void *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setDefaultLayoutRule:v4 forState:a2];
}

- (void)_configureBottomRightLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  double top = self->_screenEdgeInsets.top;
  double left = self->_screenEdgeInsets.left;
  double v14 = x + left;
  double v15 = y + top;
  double v16 = width - (left + self->_screenEdgeInsets.right);
  double v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  double v26 = width;
  double v25 = y;
  if (v5)
  {
    double v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    double v21 = v20;
    double v27 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v36);
    double v19 = v37;
    double v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxBottomCornerWidthLeavingRoomForKeylines:](self, "_maxBottomCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    double v27 = v22;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E62C1460;
  BOOL v35 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = v15;
  *(double *)&aBlock[7] = v16;
  *(double *)&aBlock[8] = v17;
  uint64_t v23 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke_2;
    v28[3] = &unk_1E62C0BD8;
    double v30 = x;
    double v31 = v25;
    double v32 = v26;
    double v33 = height;
    v28[4] = self;
    id v24 = v11;
    id v29 = v24;
    NTKEnumerateComplicationStates(v28);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v24, v5, 1, v23, v19, v21, v27, v21);
  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v23, v19, v21, v27, v21);
  }
}

id __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    double v12 = a5;
    double v13 = a6;
    double v14 = a5;
    double v15 = a6;
    if (*(unsigned char *)(a1 + 72))
    {
      double v16 = [*(id *)(a1 + 32) _curvedKeylineImageForSlot:4];
      [v16 size];
      double v18 = v17;
      double v20 = v19;

      _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v27);
      double v15 = v20 - (a4 + a6 + v29);
      double v14 = v18 - (a3 + a5 + v28);
      double v13 = v29 + a6;
      double v12 = v28 + a5;
    }
  }
  else
  {
    double v15 = *MEMORY[0x1E4FB2848];
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v21 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  double v22 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  if (a2 && *(unsigned char *)(a1 + 72))
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v26);
    double v21 = v21 - v26[31];
    double v22 = v22 - v26[32];
  }
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 1;
  }
  uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v24, 3, v23, 1, v21, v22, a3, a4, v15, v14, v13, v12);
}

void __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 3, *(void *)(*(void *)(a1 + 32) + 16), *(unsigned __int8 *)(*(void *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setDefaultLayoutRule:v4 forState:a2];
}

- (void)_configureTopBezelLayout:(id)a3 withBounds:(CGRect)a4 dialDiameter:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __82__NTKUtilityComplicationFactory__configureTopBezelLayout_withBounds_dialDiameter___block_invoke;
  double v13 = &unk_1E62C14B0;
  double v15 = a5;
  CGRect v16 = a4;
  double v14 = self;
  id v8 = a3;
  id v9 = _Block_copy(&v10);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v8, 1, 0, v9, width, height, width, height, v10, v11, v12, v13, v14, *(void *)&v15, *(void *)&v16.origin.x, *(void *)&v16.origin.y, *(void *)&v16.size.width,
    *(void *)&v16.size.height);
}

id __82__NTKUtilityComplicationFactory__configureTopBezelLayout_withBounds_dialDiameter___block_invoke(uint64_t a1, int a2, char a3)
{
  double v6 = *(double *)(a1 + 40);
  double v7 = CGRectGetHeight(*(CGRect *)(a1 + 48)) * 0.5 - v6 * 0.5;
  double Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  double v9 = *(double *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = *(double *)(v10 + 144);
  if ((a3 & 1) != 0 || a2)
  {
    _LayoutConstants_2(*(void **)(v10 + 16), v19);
    double v7 = v7 + v11 + v20;
    uint64_t v10 = *(void *)(a1 + 32);
    double v12 = *(double *)(v10 + 160) - v6;
    double v13 = v11 + v20 + v12 * 0.5;
    double v14 = v12 * 0.5;
    double v15 = -(v11 + v20 - v12 * 0.5);
    double v16 = v12 * 0.5;
  }
  else
  {
    double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v13 = *MEMORY[0x1E4FB2848];
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  uint64_t v17 = *(void *)(v10 + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v17, 1, 0, 1, Width * 0.5 - v9 * 0.5, v7, v6, v6, v13, v14, v15, v16);
}

- (void)_configureBottomCenterLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double top = self->_screenEdgeInsets.top;
  double left = self->_screenEdgeInsets.left;
  double v14 = x + left;
  double v27 = a4.size.width - (left + self->_screenEdgeInsets.right);
  double v28 = y + top;
  double v15 = a4.size.height - (top + self->_screenEdgeInsets.bottom);
  if (a5)
  {
    device = self->_device;
    id v17 = a3;
    maxNormalLongdouble Width = NTKUtilityComplicationCurvedCenterSize(device);
    NTKUtilityComplicationCurvedCenterSize(self->_device);
    double v20 = v19;
    double v21 = v14;
    double v22 = maxNormalLongWidth;
  }
  else
  {
    maxNormalLongdouble Width = self->_maxNormalLongWidth;
    uint64_t v23 = self->_device;
    id v24 = a3;
    double v20 = NTKUtilityComplicationHeight(v23);
    -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v14, v28, v27, v15);
    double v21 = v14;
    double v22 = v25;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NTKUtilityComplicationFactory__configureBottomCenterLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E62C14D8;
  BOOL v30 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = x;
  *(double *)&aBlock[6] = y;
  *(CGFloat *)&aBlock[7] = width;
  *(CGFloat *)&aBlock[8] = height;
  *(double *)&void aBlock[9] = v21;
  *(double *)&void aBlock[10] = v28;
  *(double *)&aBlock[11] = v27;
  *(double *)&aBlock[12] = v15;
  double v26 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", a3, v5, 0, v26, maxNormalLongWidth, v20, v22, v20);
}

id __81__NTKUtilityComplicationFactory__configureBottomCenterLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    double v10 = a5;
    double v11 = a6;
    double v12 = a5;
    double v13 = a6;
    if (*(unsigned char *)(a1 + 104))
    {
      double v40 = 0.0;
      _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v38);
      double v14 = v39;
      double v37 = 0.0;
      uint64_t v36 = 0;
      +[NTKUtilityComplicationFactory curvedCircleRadius:&v40 centerAngle:0 maxAngularWidth:0 circleCenter:&v36 interior:0 forSlot:10 forDevice:*(void *)(*(void *)(a1 + 32) + 16)];
      double v15 = v14 + v37 + v40;
      _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v34);
      double v16 = v15 + v35;
      double v17 = v16 + NTKUtilityComplicationCurvedBuffer(*(void **)(*(void *)(a1 + 32) + 16));
      double v18 = [*(id *)(a1 + 32) _curvedKeylineImageForSlot:10];
      [v18 size];
      double v20 = v19;
      double v22 = v21;

      double v10 = (v20 - a3) * 0.5;
      double v11 = v17 - CGRectGetMaxY(*(CGRect *)(a1 + 40));
      double v13 = v22 - a4 - v11;
      double v12 = v10;
    }
  }
  else
  {
    double v13 = *MEMORY[0x1E4FB2848];
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 72));
  CLKFloorForDevice();
  double v25 = v24;
  double v26 = CGRectGetMaxY(*(CGRect *)(a1 + 72)) - a6 - a4;
  int v27 = *(unsigned __int8 *)(a1 + 104);
  if (!*(unsigned char *)(a1 + 104) && a2)
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v32);
    double v26 = v26 - v33;
    int v27 = *(unsigned __int8 *)(a1 + 104);
  }
  if (v27) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = 1;
  }
  double v29 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 208), v28, 1, MinX + v25, v26, a3, a4, v13, v12, v11, v10);
  return v29;
}

- (void)_configureDateLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [(NTKUtilityComplicationFactory *)self _maxDateWidthLeavingRoomForKeylines];
  double v11 = v10;
  double selectedKeylineHeight = self->_selectedKeylineHeight;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__NTKUtilityComplicationFactory__configureDateLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E62C1500;
  *(CGFloat *)&aBlock[5] = x;
  *(CGFloat *)&aBlock[6] = y;
  *(CGFloat *)&aBlock[7] = width;
  *(CGFloat *)&aBlock[8] = height;
  aBlock[4] = self;
  double v13 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v9, 0, 0, v13, v11, selectedKeylineHeight, v11, selectedKeylineHeight);
}

id __65__NTKUtilityComplicationFactory__configureDateLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v6 = a6;
  double v7 = a5;
  double v11 = a6;
  double v12 = a5;
  if ((a2 & 1) == 0)
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  CGRectGetMidX(*(CGRect *)(a1 + 40));
  CLKFloorForDevice();
  double v14 = v13;
  CGRectGetMidY(*(CGRect *)(a1 + 40));
  CLKFloorForDevice();
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v16, 1, 1, 1, v14, v15, a3, a4, v6, v7, v11, v12);
}

- (void)_configureTopRightAboveLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  device = self->_device;
  id v10 = a3;
  _LayoutConstants_2(device, v25);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRect v28 = CGRectInset(v27, dx, 0.0);
  double v11 = v28.origin.x;
  double v12 = v28.origin.y;
  double v13 = v28.size.width;
  double v14 = v28.size.height;
  _LayoutConstants_2(self->_device, v23);
  double v15 = v24;
  double v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  double v18 = v17;
  double v19 = NTKUtilityComplicationHeight(self->_device);
  double crownIndicatorGap = self->_crownIndicatorGap;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__NTKUtilityComplicationFactory__configureTopRightAboveLayout_withBounds___block_invoke;
  v22[3] = &unk_1E62C14B0;
  void v22[4] = self;
  *(double *)&v22[5] = v11;
  *(double *)&v22[6] = v12;
  *(double *)&v22[7] = v13;
  *(double *)&v22[8] = v14;
  *(double *)&v22[9] = crownIndicatorGap;
  double v21 = _Block_copy(v22);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 1, v21, v15, v16, v18, v19);
}

id __74__NTKUtilityComplicationFactory__configureTopRightAboveLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v24);
    double v10 = v25;
    double v11 = *(double *)(a1 + 72);
    double v20 = a6;
    double v12 = a5;
    double v13 = a6;
    double v14 = a5;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v20 = *MEMORY[0x1E4FB2848];
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v10 = 0.0;
    double v11 = 0.0;
  }
  v27.origin.CGFloat x = *(CGFloat *)(a1 + 40);
  v27.origin.CGFloat y = *(CGFloat *)(a1 + 48);
  double v15 = v10 + v27.origin.y;
  v27.size.CGFloat width = *(CGFloat *)(a1 + 56);
  v27.size.CGFloat height = *(CGFloat *)(a1 + 64);
  double v16 = CGRectGetMaxX(v27) - a5 - v11 - a3;
  _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v22);
  double v17 = v15 + v23 + a6;
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v18, 3, 1, 1, v16, v17, a3, a4, v20, v12, v13, v14);
}

- (void)_configureTopRightBelowLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  device = self->_device;
  id v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectInset(v26, dx, 0.0);
  double v11 = v27.origin.x;
  double v12 = v27.origin.y;
  double v13 = v27.size.width;
  double v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  double v15 = v23;
  double v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  double v18 = v17;
  double v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NTKUtilityComplicationFactory__configureTopRightBelowLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E62C1500;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  double v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 0, v20, v15, v16, v18, v19);
}

id __74__NTKUtilityComplicationFactory__configureTopRightBelowLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v23);
    double v10 = v24;
    double v11 = a5;
    double v12 = a6;
    double v13 = a5;
    double v14 = a6;
  }
  else
  {
    double v14 = *MEMORY[0x1E4FB2848];
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v10 = 0.0;
  }
  v26.origin.CGFloat x = *(CGFloat *)(a1 + 40);
  v26.origin.CGFloat y = *(CGFloat *)(a1 + 48);
  double v15 = v10 + v26.origin.y;
  v26.size.CGFloat width = *(CGFloat *)(a1 + 56);
  v26.size.CGFloat height = *(CGFloat *)(a1 + 64);
  double v16 = CGRectGetMaxX(v26) - a5 - a3;
  _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v21);
  double v17 = v15 + v22 + a6;
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v18, 3, 1, 1, v16, v17, a3, a4, v14, v13, v12, v11);
}

- (void)_configureBottomRightAboveLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  device = self->_device;
  id v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectInset(v26, dx, 0.0);
  double v11 = v27.origin.x;
  double v12 = v27.origin.y;
  double v13 = v27.size.width;
  double v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  double v15 = v23;
  double v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCornerWidthLeavingRoomForKeylines:](self, "_maxBottomCornerWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  double v18 = v17;
  double v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKUtilityComplicationFactory__configureBottomRightAboveLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E62C1500;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  aBlock[4] = self;
  double v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 1, v20, v15, v16, v18, v19);
}

id __77__NTKUtilityComplicationFactory__configureBottomRightAboveLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10 = a6;
  double v11 = a5;
  double v12 = a6;
  double v13 = a5;
  if ((a2 & 1) == 0)
  {
    double v10 = *MEMORY[0x1E4FB2848];
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v14 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  CGFloat v15 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v19);
  double v16 = v15 + v20;
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v17, 3, 1, 1, v14, v16, a3, a4, v10, v11, v12, v13);
}

- (void)_configureBottomRightBelowLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  device = self->_device;
  id v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectInset(v26, dx, 0.0);
  double v11 = v27.origin.x;
  double v12 = v27.origin.y;
  double v13 = v27.size.width;
  double v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  double v15 = v23;
  double v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  double v18 = v17;
  double v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKUtilityComplicationFactory__configureBottomRightBelowLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E62C1500;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  aBlock[4] = self;
  double v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 0, v20, v15, v16, v18, v19);
}

id __77__NTKUtilityComplicationFactory__configureBottomRightBelowLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10 = a6;
  double v11 = a5;
  double v12 = a6;
  double v13 = a5;
  if ((a2 & 1) == 0)
  {
    double v10 = *MEMORY[0x1E4FB2848];
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v14 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  CGFloat v15 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v19);
  double v16 = v15 + v20;
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v17, 3, 1, 1, v14, v16, a3, a4, v10, v11, v12, v13);
}

- (void)_configureBottomRightLongLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  device = self->_device;
  id v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect v27 = CGRectInset(v26, dx, 0.0);
  double v11 = v27.origin.x;
  double v12 = v27.origin.y;
  double v13 = v27.size.width;
  double v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  double v15 = v23;
  double v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  double v18 = v17;
  double v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NTKUtilityComplicationFactory__configureBottomRightLongLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E62C1500;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  aBlock[4] = self;
  double v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 0, v20, v15, v16, v18, v19);
}

id __76__NTKUtilityComplicationFactory__configureBottomRightLongLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10 = a6;
  double v11 = a5;
  double v12 = a6;
  double v13 = a5;
  if ((a2 & 1) == 0)
  {
    double v10 = *MEMORY[0x1E4FB2848];
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v14 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  CGFloat v15 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v19);
  double v16 = v15 + v20;
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v17, 2, 1, 1, v14, v16, a3, a4, v10, v11, v12, v13);
}

- (void)_configureUpNextTopRightLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  device = self->_device;
  id v10 = a3;
  _LayoutConstants_2(device, v25);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRect v28 = CGRectInset(v27, dx, 0.0);
  double v11 = v28.origin.x;
  double v12 = v28.origin.y;
  double v13 = v28.size.width;
  double v14 = v28.size.height;
  _LayoutConstants_2(self->_device, v23);
  double v15 = v24 + 1.0;
  double v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  double v18 = v17;
  double v19 = NTKUtilityComplicationHeight(self->_device);
  double crownIndicatorGap = self->_crownIndicatorGap;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__NTKUtilityComplicationFactory__configureUpNextTopRightLayout_withBounds___block_invoke;
  v22[3] = &unk_1E62C14B0;
  void v22[4] = self;
  *(double *)&v22[5] = v11;
  *(double *)&v22[6] = v12;
  *(double *)&v22[7] = v13;
  *(double *)&v22[8] = v14;
  *(double *)&v22[9] = crownIndicatorGap;
  double v21 = _Block_copy(v22);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 1, v21, v15, v16, v18, v19);
}

id __75__NTKUtilityComplicationFactory__configureUpNextTopRightLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  if (a2)
  {
    _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v24);
    double v10 = v25;
    double v11 = *(double *)(a1 + 72);
    double v20 = a6;
    double v12 = a5;
    double v13 = a6;
    double v14 = a5;
  }
  else
  {
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v20 = *MEMORY[0x1E4FB2848];
    double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v10 = 0.0;
    double v11 = 0.0;
  }
  v27.origin.CGFloat x = *(CGFloat *)(a1 + 40);
  v27.origin.CGFloat y = *(CGFloat *)(a1 + 48);
  double v15 = v10 + v27.origin.y;
  v27.size.CGFloat width = *(CGFloat *)(a1 + 56);
  v27.size.CGFloat height = *(CGFloat *)(a1 + 64);
  double v16 = CGRectGetMaxX(v27) - a5 - v11 - a3;
  _LayoutConstants_2(*(void **)(*(void *)(a1 + 32) + 16), v22);
  double v17 = v15 + v23 + a6;
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 16);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", v18, 3, 1, 1, v16, v17, a3, a4, v20, v12, v13, v14);
}

- (void)_configureLayout:(id)a3 withNormalSize:(CGSize)a4 editingSize:(CGSize)a5 variant:(BOOL)a6 addCircleOverrides:(BOOL)a7 makeRuleBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a5.height;
  double width = a5.width;
  double v13 = a4.height;
  double v14 = a4.width;
  id v39 = a3;
  id v16 = a8;
  if (v10)
  {
    _LayoutConstants_2(self->_device, v54);
    double normalSidePadding = v55;
    _LayoutConstants_2(self->_device, v52);
    p_normalVerticalPadding = (double *)&v53;
  }
  else
  {
    double normalSidePadding = self->_normalSidePadding;
    p_normalVerticalPadding = &self->_normalVerticalPadding;
  }
  double v19 = (*((void (**)(id, void, void, double, double, double, double))v16 + 2))(v16, 0, 0, v14, v13, normalSidePadding, *p_normalVerticalPadding);
  [v39 setDefaultLayoutRule:v19 forState:0];

  if (v10)
  {
    _LayoutConstants_2(self->_device, v50);
    double v20 = v51;
    _LayoutConstants_2(self->_device, v48);
    double v21 = (double *)&v49;
  }
  else
  {
    double v20 = self->_normalSidePadding;
    double v21 = &self->_normalVerticalPadding;
  }
  double v22 = (*((void (**)(id, void, void, double, double, double, double))v16 + 2))(v16, 0, 0, width, height, v20, *v21);
  [v39 setDefaultLayoutRule:v22 forState:1];

  if (v10)
  {
    _LayoutConstants_2(self->_device, v46);
    double v23 = v47;
    _LayoutConstants_2(self->_device, v44);
    v24.n128_u64[0] = v45;
  }
  else
  {
    double v23 = NTKKeylineWidth() + self->_deselectedKeylineSideInnerPadding;
    v24.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineVerticalInnerPadding;
  }
  double v25 = (*((void (**)(id, uint64_t, void, double, double, double, __n128))v16 + 2))(v16, 1, 0, width, height, v23, v24);
  [v39 setDefaultLayoutRule:v25 forState:2];

  if (v10)
  {
    _LayoutConstants_2(self->_device, v42);
    double v26 = v43;
    _LayoutConstants_2(self->_device, v40);
    v27.n128_u64[0] = v41;
  }
  else
  {
    double v26 = NTKKeylineWidth() + self->_selectedKeylineSideInnerPadding;
    NTKUtilityComplicationSelectedMaxHeight(self->_device);
    CLKFloorForDevice();
    v27.n128_u64[0] = v28;
  }
  double v29 = (*((void (**)(id, uint64_t, uint64_t, double, double, double, __n128))v16 + 2))(v16, 1, 1, width, height + self->_selectedKeylineVerticalInnerContentSpacer * 2.0, v26, v27);
  [v39 setDefaultLayoutRule:v29 forState:3];

  if (v9)
  {
    double v30 = NTKUtilityComplicationCircularDiameter(self->_device);
    double v31 = NTKUtilityComplicationCircularDiameter(self->_device);
    double v32 = (*((void (**)(id, void, void, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    [v39 setOverrideLayoutRule:v32 forState:0 layoutOverride:2];

    double v33 = (*((void (**)(id, void, void, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    [v39 setOverrideLayoutRule:v33 forState:1 layoutOverride:2];

    if (v10)
    {
      double v35 = self->_normalCircularPadding.width;
      v34.n128_u64[0] = *(void *)&self->_normalCircularPadding.height;
    }
    else
    {
      double v35 = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
      v34.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
    }
    uint64_t v36 = (*((void (**)(id, uint64_t, void, double, double, double, __n128))v16 + 2))(v16, 1, 0, v30, v31, v35, v34);
    [v39 setOverrideLayoutRule:v36 forState:2 layoutOverride:2];

    if (v10)
    {
      double v37 = (*((void (**)(id, uint64_t, uint64_t, double, double, CGFloat, CGFloat))v16 + 2))(v16, 1, 1, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    }
    else
    {
      double v38 = [v39 defaultLayoutRuleForState:3];
      double v37 = (void *)[v38 copy];

      [v37 setVerticalLayout:4];
    }
    [v39 setOverrideLayoutRule:v37 forState:3 layoutOverride:2];
  }
}

- (void)_configureOverridesForLayout:(id)a3 withNormalSize:(CGSize)a4 editingSize:(CGSize)a5 variant:(BOOL)a6 addCircleOverrides:(BOOL)a7 makeRuleBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a5.height;
  double width = a5.width;
  double v13 = a4.height;
  double v14 = a4.width;
  id v39 = a3;
  id v16 = a8;
  if (v10)
  {
    _LayoutConstants_2(self->_device, v54);
    double normalSidePadding = v55;
    _LayoutConstants_2(self->_device, v52);
    p_normalVerticalPadding = (double *)&v53;
  }
  else
  {
    double normalSidePadding = self->_normalSidePadding;
    p_normalVerticalPadding = &self->_normalVerticalPadding;
  }
  double v19 = (*((void (**)(id, void, void, double, double, double, double))v16 + 2))(v16, 0, 0, v14, v13, normalSidePadding, *p_normalVerticalPadding);
  [v39 setOverrideLayoutRule:v19 forState:0 layoutOverride:1];

  if (v10)
  {
    _LayoutConstants_2(self->_device, v50);
    double v20 = v51;
    _LayoutConstants_2(self->_device, v48);
    double v21 = (double *)&v49;
  }
  else
  {
    double v20 = self->_normalSidePadding;
    double v21 = &self->_normalVerticalPadding;
  }
  double v22 = (*((void (**)(id, void, void, double, double, double, double))v16 + 2))(v16, 0, 0, width, height, v20, *v21);
  [v39 setOverrideLayoutRule:v22 forState:1 layoutOverride:1];

  if (v10)
  {
    _LayoutConstants_2(self->_device, v46);
    double v23 = v47;
    _LayoutConstants_2(self->_device, v44);
    v24.n128_u64[0] = v45;
  }
  else
  {
    double v23 = NTKKeylineWidth() + self->_deselectedKeylineSideInnerPadding;
    v24.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineVerticalInnerPadding;
  }
  double v25 = (*((void (**)(id, uint64_t, void, double, double, double, __n128))v16 + 2))(v16, 1, 0, width, height, v23, v24);
  [v39 setOverrideLayoutRule:v25 forState:2 layoutOverride:1];

  if (v10)
  {
    _LayoutConstants_2(self->_device, v42);
    double v26 = v43;
    _LayoutConstants_2(self->_device, v40);
    v27.n128_u64[0] = v41;
  }
  else
  {
    double v26 = NTKKeylineWidth() + self->_selectedKeylineSideInnerPadding;
    NTKUtilityComplicationSelectedMaxHeight(self->_device);
    CLKFloorForDevice();
    v27.n128_u64[0] = v28;
  }
  double v29 = (*((void (**)(id, uint64_t, uint64_t, double, double, double, __n128))v16 + 2))(v16, 1, 1, width, height + self->_selectedKeylineVerticalInnerContentSpacer * 2.0, v26, v27);
  [v39 setOverrideLayoutRule:v29 forState:3 layoutOverride:1];

  if (v9)
  {
    double v30 = NTKUtilityComplicationCircularDiameter(self->_device);
    double v31 = NTKUtilityComplicationCircularDiameter(self->_device);
    double v32 = (*((void (**)(id, void, void, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    [v39 setOverrideLayoutRule:v32 forState:0 layoutOverride:2];

    double v33 = (*((void (**)(id, void, void, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    [v39 setOverrideLayoutRule:v33 forState:1 layoutOverride:2];

    if (v10)
    {
      double v35 = self->_normalCircularPadding.width;
      v34.n128_u64[0] = *(void *)&self->_normalCircularPadding.height;
    }
    else
    {
      double v35 = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
      v34.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
    }
    uint64_t v36 = (*((void (**)(id, uint64_t, void, double, double, double, __n128))v16 + 2))(v16, 1, 0, v30, v31, v35, v34);
    [v39 setOverrideLayoutRule:v36 forState:2 layoutOverride:2];

    if (v10)
    {
      double v37 = (*((void (**)(id, uint64_t, uint64_t, double, double, CGFloat, CGFloat))v16 + 2))(v16, 1, 1, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    }
    else
    {
      double v38 = [v39 defaultLayoutRuleForState:3];
      double v37 = (void *)[v38 copy];

      [v37 setVerticalLayout:4];
    }
    [v39 setOverrideLayoutRule:v37 forState:3 layoutOverride:2];
  }
}

- (double)_maxTopCornerWidthLeavingRoomForKeylines:(CGRect)a3
{
  _LayoutConstants_2(self->_device, v8);
  CLKFloorForDevice();
  double v5 = v4;
  [(NTKUtilityComplicationFactory *)self _maxWidthForKeylineAndPadding];
  return v5 - v6;
}

- (double)_maxBottomCornerWidthLeavingRoomForKeylines:(CGRect)a3
{
  _LayoutConstants_2(self->_device, v8);
  CLKFloorForDevice();
  double v5 = v4;
  [(NTKUtilityComplicationFactory *)self _maxWidthForKeylineAndPadding];
  return v5 - v6;
}

- (double)_maxBottomCenterWidthLeavingRoomForKeylines:(CGRect)a3
{
  double width = a3.size.width;
  [(NTKUtilityComplicationFactory *)self _maxWidthForKeylineAndPadding];
  return width - v4;
}

- (double)_maxDateWidthLeavingRoomForKeylines
{
  dateKeylineMaxdouble Width = self->_dateKeylineMaxWidth;
  [(NTKUtilityComplicationFactory *)self _maxWidthForKeylineAndPadding];
  return dateKeylineMaxWidth - v3;
}

- (double)_maxWidthForKeylineAndPadding
{
  if (self->_selectedKeylineSideInnerPadding >= self->_deselectedKeylineSideInnerPadding) {
    double selectedKeylineSideInnerPadding = self->_selectedKeylineSideInnerPadding;
  }
  else {
    double selectedKeylineSideInnerPadding = self->_deselectedKeylineSideInnerPadding;
  }
  double v3 = NTKKeylineWidth();
  return selectedKeylineSideInnerPadding + v3 + selectedKeylineSideInnerPadding + v3;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  if ([a3 isEqualToString:@"bezel"]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [(NTKUtilityComplicationFactory *)self dialDiameter];
  -[NTKUtilityComplicationFactory configureComplicationView:forSlot:dialDiameter:](self, "configureComplicationView:forSlot:dialDiameter:", v13, v6);
  if ([v13 conformsToProtocol:&unk_1FCDFDC40])
  {
    id v7 = v13;
    id v8 = [(NTKUtilityComplicationFactory *)self faceView];
    int v9 = [v8 conformsToProtocol:&unk_1FCE1B5D0];

    if (v9)
    {
      BOOL v10 = [(NTKUtilityComplicationFactory *)self faceView];
      [v7 setDelegate:v10];
    }
  }
  if ([v13 conformsToProtocol:&unk_1FCD8CF80])
  {
    id v11 = v13;
    if ([v6 isEqualToString:@"top-left"])
    {
      uint64_t v12 = 0;
    }
    else if ([v6 isEqualToString:@"top-right"])
    {
      uint64_t v12 = 1;
    }
    else if ([v6 isEqualToString:@"bottom-left"])
    {
      uint64_t v12 = 2;
    }
    else
    {
      if (![v6 isEqualToString:@"bottom-right"])
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v12 = 3;
    }
    [v11 setCornerComplicationPosition:v12];
    goto LABEL_15;
  }
LABEL_16:
}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_graphicCornerComplications)
  {
    if ([v4 isEqualToString:@"top-left"])
    {
      device = self->_device;
      BOOL usesNarrowTopSlots = self->_usesNarrowTopSlots;
      uint64_t v8 = 0;
LABEL_10:
      uint64_t v9 = +[NTKRichComplicationCornerUtilities keylineViewForPosition:v8 forDevice:device narrowTopSlots:usesNarrowTopSlots];
      goto LABEL_12;
    }
    if ([v5 isEqualToString:@"top-right"])
    {
      device = self->_device;
      BOOL usesNarrowTopSlots = self->_usesNarrowTopSlots;
      uint64_t v8 = 1;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"bottom-left"])
    {
      device = self->_device;
      BOOL usesNarrowTopSlots = self->_usesNarrowTopSlots;
      uint64_t v8 = 2;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"bottom-right"])
    {
      device = self->_device;
      BOOL usesNarrowTopSlots = self->_usesNarrowTopSlots;
      uint64_t v8 = 3;
      goto LABEL_10;
    }
  }
  uint64_t v9 = [(NTKUtilityComplicationFactory *)self keylineViewForSlot:[(NTKUtilityComplicationFactory *)self _utilitySlotForSlot:v5] dialDiameter:self->_bezelKeylineDiameter];
LABEL_12:
  BOOL v10 = (void *)v9;

  return v10;
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  int64_t v6 = [(NTKUtilityComplicationFactory *)self _utilitySlotForSlot:a4];
  return [(NTKUtilityComplicationFactory *)self layoutOverrideForComplicationType:a3 inSlot:v6];
}

- (unint64_t)layoutStyleForSlot:(id)a3
{
  return [a3 isEqualToString:@"bezel"];
}

- (void)curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v13 = (__CFString *)a8;
  if (@"bezel" == v13)
  {
    unint64_t v28 = v13;
    if (a3)
    {
      [(NTKUtilityComplicationFactory *)self dialDiameter];
      [(NTKUtilityComplicationFactory *)self bezelComplicationRadiusWithDialDiameter:v14 + v14];
      id v13 = v28;
      *(void *)a3 = v15;
    }
    if (a5)
    {
      [(NTKUtilityComplicationFactory *)self bezelComplicationMaxAngularWidth];
      id v13 = v28;
      *(void *)a5 = v16;
    }
    if (a6)
    {
      double v17 = [(NTKUtilityComplicationFactory *)self faceView];
      [v17 bounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;

      v30.origin.CGFloat x = v19;
      v30.origin.CGFloat y = v21;
      v30.size.double width = v23;
      v30.size.double height = v25;
      CGFloat MidX = CGRectGetMidX(v30);
      v31.origin.CGFloat x = v19;
      v31.origin.CGFloat y = v21;
      v31.size.double width = v23;
      v31.size.double height = v25;
      CGFloat MidY = CGRectGetMidY(v31);
      id v13 = v28;
      a6->CGFloat x = MidX;
      a6->CGFloat y = MidY;
    }
    if (a7) {
      *a7 = 0;
    }
  }
}

- (void)loadLayoutRules
{
  double v3 = [(NTKUtilityComplicationFactory *)self faceView];
  id v9 = [v3 complicationLayoutforSlot:@"bezel"];

  id v4 = [(NTKUtilityComplicationFactory *)self faceView];
  [v4 bounds];
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:bounds:dialDiameter:](self, "configureComplicationLayout:forSlot:bounds:dialDiameter:", v9, 11);

  if ([(NTKUtilityComplicationFactory *)self includesDateComplicationLayoutRules])
  {
    double v5 = [(NTKUtilityComplicationFactory *)self faceView];
    int64_t v6 = [v5 complicationLayoutforSlot:@"date"];

    int64_t v7 = [(NTKUtilityComplicationFactory *)self _utilitySlotForSlot:@"date"];
    uint64_t v8 = [(NTKUtilityComplicationFactory *)self faceView];
    [v8 bounds];
    -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self, "configureComplicationLayout:forSlot:withBounds:", v6, v7);
  }
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = [(NTKUtilityComplicationFactory *)self newViewForComplication:v8 family:a4 forSlot:[(NTKUtilityComplicationFactory *)self _utilitySlotForSlot:a5]];

  return v9;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"bezel"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"top-left"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"bottom-left"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"bottom-center"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"top-right"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"bottom-right"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"date"])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  int64_t v4 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 0xB && ((0xA0Fu >> v4))
  {
    double v5 = *off_1E62C1520[v4];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKUtilityComplicationFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKUtilityComplicationFactoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)graphicCornerComplications
{
  return self->_graphicCornerComplications;
}

- (void)setGraphicCornerComplications:(BOOL)a3
{
  self->_graphicCornerComplications = a3;
}

- (BOOL)usesNarrowTopSlots
{
  return self->_usesNarrowTopSlots;
}

- (void)setUsesNarrowTopSlots:(BOOL)a3
{
  self->_BOOL usesNarrowTopSlots = a3;
}

- (BOOL)accommodatesTwoTopComplications
{
  return self->_accommodatesTwoTopComplications;
}

- (void)setAccommodatesTwoTopComplications:(BOOL)a3
{
  self->_accommodatesTwoTopComplications = a3;
}

- (double)normalSidePadding
{
  return self->_normalSidePadding;
}

- (void)setNormalSidePadding:(double)a3
{
  self->_double normalSidePadding = a3;
}

- (double)normalVerticalPadding
{
  return self->_normalVerticalPadding;
}

- (void)setNormalVerticalPadding:(double)a3
{
  self->_normalVerticalPadding = a3;
}

- (CGSize)normalCircularPadding
{
  double width = self->_normalCircularPadding.width;
  double height = self->_normalCircularPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNormalCircularPadding:(CGSize)a3
{
  self->_normalCircularPadding = a3;
}

- (double)deselectedKeylineSideInnerPadding
{
  return self->_deselectedKeylineSideInnerPadding;
}

- (void)setDeselectedKeylineSideInnerPadding:(double)a3
{
  self->_dedouble selectedKeylineSideInnerPadding = a3;
}

- (double)deselectedKeylineVerticalInnerPadding
{
  return self->_deselectedKeylineVerticalInnerPadding;
}

- (void)setDeselectedKeylineVerticalInnerPadding:(double)a3
{
  self->_deselectedKeylineVerticalInnerPadding = a3;
}

- (double)deselectedKeylineCircularInnerPadding
{
  return self->_deselectedKeylineCircularInnerPadding;
}

- (void)setDeselectedKeylineCircularInnerPadding:(double)a3
{
  self->_deselectedKeylineCircularInnerPadding = a3;
}

- (double)selectedKeylineSideInnerPadding
{
  return self->_selectedKeylineSideInnerPadding;
}

- (void)setSelectedKeylineSideInnerPadding:(double)a3
{
  self->_double selectedKeylineSideInnerPadding = a3;
}

- (double)selectedKeylineVerticalInnerContentSpacer
{
  return self->_selectedKeylineVerticalInnerContentSpacer;
}

- (void)setSelectedKeylineVerticalInnerContentSpacer:(double)a3
{
  self->_selectedKeylineVerticalInnerContentSpacer = a3;
}

- (double)selectedKeylineHeight
{
  return self->_selectedKeylineHeight;
}

- (void)setSelectedKeylineHeight:(double)a3
{
  self->_double selectedKeylineHeight = a3;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (double)foregroundImageAlpha
{
  return self->_foregroundImageAlpha;
}

- (void)setForegroundImageAlpha:(double)a3
{
  self->_foregroundImageAlpha = a3;
}

- (double)maxNormalLongWidth
{
  return self->_maxNormalLongWidth;
}

- (void)setMaxNormalLongWidth:(double)a3
{
  self->_maxNormalLongdouble Width = a3;
}

- (UIEdgeInsets)screenEdgeInsets
{
  double top = self->_screenEdgeInsets.top;
  double left = self->_screenEdgeInsets.left;
  double bottom = self->_screenEdgeInsets.bottom;
  double right = self->_screenEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setScreenEdgeInsets:(UIEdgeInsets)a3
{
  self->_screenEdgeInsets = a3;
}

- (double)crownIndicatorGap
{
  return self->_crownIndicatorGap;
}

- (void)setCrownIndicatorGap:(double)a3
{
  self->_double crownIndicatorGap = a3;
}

- (CLKFont)topBezelLabelFont
{
  return self->_topBezelLabelFont;
}

- (void)setTopBezelLabelFont:(id)a3
{
}

- (double)bezelLabelMaxWidthInDegree
{
  return self->_bezelLabelMaxWidthInDegree;
}

- (void)setBezelLabelMaxWidthInDegree:(double)a3
{
  self->_bezelLabelMaxWidthInDegree = a3;
}

- (double)bezelLabelTopPadding
{
  return self->_bezelLabelTopPadding;
}

- (void)setBezelLabelTopPadding:(double)a3
{
  self->_bezelLabelTopPadding = a3;
}

- (double)bezelKeylineInnerCircleOffset
{
  return self->_bezelKeylineInnerCircleOffset;
}

- (void)setBezelKeylineInnerCircleOffset:(double)a3
{
  self->_bezelKeylineInnerCircleOffset = a3;
}

- (double)bezelKeylineDiameter
{
  return self->_bezelKeylineDiameter;
}

- (void)setBezelKeylineDiameter:(double)a3
{
  self->_bezelKeylineDiameter = a3;
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void)setDialDiameter:(double)a3
{
  self->_dialDiameter = a3;
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (double)dateKeylineMaxWidth
{
  return self->_dateKeylineMaxWidth;
}

- (void)setDateKeylineMaxWidth:(double)a3
{
  self->_dateKeylineMaxdouble Width = a3;
}

- (double)dateHorizontalCenterOffset
{
  return self->_dateHorizontalCenterOffset;
}

- (void)setDateHorizontalCenterOffset:(double)a3
{
  self->_dateHorizontalCenterOffset = a3;
}

- (double)dateVerticalCenterOffset
{
  return self->_dateVerticalCenterOffset;
}

- (void)setDateVerticalCenterOffset:(double)a3
{
  self->_dateVerticalCenterOffset = a3;
}

- (BOOL)includesDateComplicationLayoutRules
{
  return self->_includesDateComplicationLayoutRules;
}

- (void)setIncludesDateComplicationLayoutRules:(BOOL)a3
{
  self->_includesDateComplicationLayoutRules = a3;
}

- (int64_t)bottomCenterLayout
{
  return self->_bottomCenterLayout;
}

- (void)setBottomCenterLayout:(int64_t)a3
{
  self->_bottomCenterLayout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_topBezelLabelFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
}

@end