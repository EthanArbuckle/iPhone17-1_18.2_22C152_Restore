@interface NTKVictoryAnalogBackgroundView
+ (id)_disabledLayerActions;
- (BOOL)isCircularDial;
- (CGColor)_layerTransitionColorFromColor:(id)a3 toColor:(id)a4 amount:(double)a5;
- (CGPoint)_ringDigitOffsetAtIndex:(unint64_t)a3;
- (CGPoint)centerPointForSmallHourMarkerAtIndex:(unint64_t)a3;
- (CGPoint)logoPositionForStyle:(unint64_t)a3;
- (CGSize)logoSizeForStyle:(unint64_t)a3;
- (NTKVictoryAnalogBackgroundColorPalette)palette;
- (NTKVictoryAnalogBackgroundView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (NTKVictoryAnalogBackgroundViewDelegate)delegate;
- (UIImage)logoImage;
- (double)_elementScaleForTransitionProgress:(double)a3 initialScale:(double)a4 middleScale:(double)a5 finalScale:(double)a6;
- (double)_transitionProgressForDigitAtIndex:(unint64_t)a3 overallProgress:(double)a4 delayPerDigit:(double)a5 digitTransitionLength:(double)a6;
- (id)_activeRingLayers;
- (id)_activeRingObjects;
- (id)_circularDialLogoImage;
- (id)_createAndAddLayersWithCount:(unint64_t)a3;
- (id)_createHourMarkerLabelsWithFontSize:(double)a3;
- (id)_createSmallHourMarkerLabelForIndex:(id)a3;
- (id)_dotImage;
- (id)digitForLargeNumberAtIndex:(int64_t)a3;
- (unint64_t)_digitForIndex:(unint64_t)a3;
- (unint64_t)dialShape;
- (unint64_t)style;
- (void)_applyPalette:(id)a3 forStyle:(unint64_t)a4;
- (void)_clearTransitionStateForStyle:(unint64_t)a3 palette:(id)a4;
- (void)_createLargeHourMarkerLabelsAndAttachToViewIfNeeded;
- (void)_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded;
- (void)_createRingLayersIfNeeded;
- (void)_logoTapped:(id)a3;
- (void)_setRingLayerAtIndex:(unint64_t)a3 isDigit:(BOOL)a4;
- (void)addLogoButtonIfNeeded;
- (void)addSmallLogoButtonIfNeeded;
- (void)applyTransitionFraction:(double)a3 fromDialShape:(unint64_t)a4 toDialShape:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromOlympusStyle:(unint64_t)a4 toOlympusStyle:(unint64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5 style:(unint64_t)a6;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5 style:(unint64_t)a6 animateElements:(BOOL)a7;
- (void)layoutNumbers;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDialShape:(unint64_t)a3;
- (void)setInTimeTravel:(BOOL)a3 animated:(BOOL)a4;
- (void)setLogoImage:(id)a3;
- (void)setPalette:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)willBeginEditing;
@end

@implementation NTKVictoryAnalogBackgroundView

- (NTKVictoryAnalogBackgroundView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v51.receiver = self;
  v51.super_class = (Class)NTKVictoryAnalogBackgroundView;
  v11 = -[NTKVictoryAnalogBackgroundView initWithFrame:](&v51, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    memset(v28, 0, sizeof(v28));
    _LayoutConstants_37(v12->_device, v28);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v12->_contentView;
    v12->_contentView = v13;

    [(NTKVictoryAnalogBackgroundView *)v12 addSubview:v12->_contentView];
    v15 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKVictoryAnalogBackgroundView *)v12 setBackgroundColor:v15];

    [(NTKVictoryAnalogBackgroundView *)v12 setOpaque:1];
    v12->_dialShape = 1;
    *(_DWORD *)&v12->_canonicalDigitStatesByStyle[2][8] = 0;
    *(_OWORD *)&v12->_canonicalDigitStatesByStyle[0][0] = 0u;
    *(_OWORD *)&v12->_canonicalDigitStatesByStyle[1][4] = 0u;
    activeDigitIndices = v12->_activeDigitIndices;
    v12->_activeDigitIndices = (NSArray *)&unk_1F16EA198;

    if ([(NSArray *)v12->_activeDigitIndices count])
    {
      unint64_t v17 = 0;
      do
      {
        v18 = [(NSArray *)v12->_activeDigitIndices objectAtIndex:v17];
        if ([v18 count])
        {
          unint64_t v19 = 0;
          do
          {
            v20 = [v18 objectAtIndex:v19];
            uint64_t v21 = [v20 unsignedIntegerValue];

            v12->_canonicalDigitStatesByStyle[v17][v21] = 1;
            ++v19;
          }
          while (v19 < [v18 count]);
        }

        ++v17;
      }
      while (v17 < [(NSArray *)v12->_activeDigitIndices count]);
    }
    CGFloat v22 = height * 0.5 + *((double *)&v29 + 1);
    v12->_logoPositionRing.double x = width * 0.5 + *(double *)&v29;
    v12->_logoPositionRing.double y = v22;
    CGFloat v23 = height * 0.5 + *((double *)&v30 + 1);
    v12->_logoPositionNoDigits.double x = width * 0.5 + *(double *)&v30;
    v12->_logoPositionNoDigits.double y = v23;
    CGFloat v24 = height * 0.5 + *((double *)&v46 + 1);
    v12->_logoPositionBig.double x = width * 0.5 + *(double *)&v46;
    v12->_logoPositionBig.double y = v24;
    CGFloat v25 = height * 0.5 + *((double *)&v47 + 1);
    v12->_logoPositionSmallFont.double x = width * 0.5 + *(double *)&v47;
    v12->_logoPositionSmallFont.double y = v25;
    CGFloat v26 = height * 0.5 + *((double *)&v48 + 1);
    v12->_logoPositionCircularDial.double x = width * 0.5 + *(double *)&v48;
    v12->_logoPositionCircularDial.double y = v26;
  }

  return v12;
}

- (void)addLogoButtonIfNeeded
{
  if (!self->_logoButton)
  {
    v3 = +[NTKVictoryLogoButton buttonWithType:0];
    logoButton = self->_logoButton;
    self->_logoButton = v3;

    v5 = self->_logoButton;
    v6 = [(NTKVictoryAnalogBackgroundView *)self logoImage];
    [(NTKVictoryLogoButton *)v5 setBackgroundImage:v6 forState:0];

    v7 = self->_logoButton;
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(NTKVictoryAnalogBackgroundView *)self logoSizeForStyle:self->_style];
    -[NTKVictoryLogoButton setBounds:](v7, "setBounds:", v8, v9, v10, v11);
    [(NTKVictoryLogoButton *)self->_logoButton addTarget:self action:sel__logoTapped_ forControlEvents:64];
    [(UIView *)self->_contentView addSubview:self->_logoButton];
    [(NTKVictoryAnalogBackgroundView *)self logoPositionForStyle:self->_style];
    v12 = self->_logoButton;
    -[UIView setPosition:](v12, "setPosition:");
  }
}

- (void)addSmallLogoButtonIfNeeded
{
  if (!self->_smallLogoButton)
  {
    v3 = +[NTKVictoryLogoButton buttonWithType:0];
    smallLogoButton = self->_smallLogoButton;
    self->_smallLogoButton = v3;

    v5 = self->_smallLogoButton;
    v6 = [(NTKVictoryAnalogBackgroundView *)self _circularDialLogoImage];
    [(NTKVictoryLogoButton *)v5 setBackgroundImage:v6 forState:0];

    v7 = self->_smallLogoButton;
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    _LayoutConstants_37(self->_device, v12);
    -[NTKVictoryLogoButton setBounds:](v7, "setBounds:", v8, v9, v12[60], v12[61]);
    [(NTKVictoryLogoButton *)self->_smallLogoButton addTarget:self action:sel__logoTapped_ forControlEvents:64];
    [(NTKVictoryLogoButton *)self->_smallLogoButton setHidden:1];
    -[NTKVictoryLogoButton setCenter:](self->_smallLogoButton, "setCenter:", self->_logoPositionCircularDial.x, self->_logoPositionCircularDial.y);
    contentView = self->_contentView;
    double v11 = self->_smallLogoButton;
    [(UIView *)contentView addSubview:v11];
  }
}

- (void)_logoTapped:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(NTKVictoryAnalogBackgroundView *)self delegate];
  objc_msgSend(v13, "logoTappedFromRect:", v6, v8, v10, v12);
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)NTKVictoryAnalogBackgroundView;
  [(NTKVictoryAnalogBackgroundView *)&v18 layoutSubviews];
  contentView = self->_contentView;
  [(NTKVictoryAnalogBackgroundView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](contentView, "ntk_setBoundsAndPositionFromFrame:");
  memset(v17, 0, sizeof(v17));
  _LayoutConstants_37(self->_device, v17);
  [(NTKVictoryAnalogBackgroundView *)self bounds];
  unint64_t v4 = 0;
  double v6 = v5 * 0.5;
  double v8 = v7 * 0.5;
  do
  {
    float v9 = (float)v4 * 6.28318531 / 12.0;
    __sincosf_stret(v9);
    CLKRoundForDevice();
    double v11 = v10;
    CLKRoundForDevice();
    double v13 = v12;
    v14 = [(NSMutableArray *)self->_ringLayers objectAtIndex:v4];
    objc_msgSend(v14, "setPosition:", v6 + v11, v8 + v13);

    ++v4;
  }
  while (v4 != 12);
  smallHourMarkerLabelsByIndedouble x = self->_smallHourMarkerLabelsByIndex;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__NTKVictoryAnalogBackgroundView_layoutSubviews__block_invoke;
  v16[3] = &unk_1E62C6ED8;
  v16[4] = self;
  [(NSMutableDictionary *)smallHourMarkerLabelsByIndex enumerateKeysAndObjectsUsingBlock:v16];
  [(NTKVictoryAnalogBackgroundView *)self layoutNumbers];
}

void __48__NTKVictoryAnalogBackgroundView_layoutSubviews__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "centerPointForSmallHourMarkerAtIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
  objc_msgSend(v5, "setCenter:");
}

- (CGPoint)centerPointForSmallHourMarkerAtIndex:(unint64_t)a3
{
  [(NTKVictoryAnalogBackgroundView *)self _ringDigitOffsetAtIndex:a3];
  double v5 = v4;
  double v7 = v6;
  [(NTKVictoryAnalogBackgroundView *)self bounds];
  double v10 = v5 + v8 * 0.5;
  double v11 = v7 + v9 * 0.5;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)layoutNumbers
{
  v3 = (double *)&v39[22] + 1;
  memset(v39, 0, sizeof(v39));
  _LayoutConstants_37(self->_device, v39);
  [(NTKVictoryAnalogBackgroundView *)self bounds];
  uint64_t v4 = 0;
  double v6 = v5 * 0.5;
  double v8 = v7 * 0.5;
  double v9 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  do
  {
    if ([(NSArray *)self->_largeHourMarkerLabels count] >= 4)
    {
      double v10 = [(NSArray *)self->_largeHourMarkerLabels objectAtIndex:v4];
      double v11 = v10;
      if (self->_style < 5)
      {
        double v12 = v6 + *(v3 - 17);
        double v16 = v8 + *(v3 - 16);
      }
      else
      {
        double v12 = *(v3 - 9);
        double v13 = *(v3 - 8);
        [v10 bounds];
        double v14 = v13 + CGRectGetHeight(v40) * -0.5;
        [v11 _baselineOffsetFromBottom];
        double v16 = v15 + v14;
      }
      objc_msgSend(v11, "setCenter:", v12, v16);
    }
    if ([(NSArray *)self->_mediumNumberLayers count] >= 4)
    {
      double v17 = *(v3 - 1);
      double v18 = *v3;
      unint64_t v19 = [(NSArray *)self->_mediumNumberLayers objectAtIndex:v4];
      objc_msgSend(v19, "setPosition:", v6 + v17, v8 + v18);
      long long v20 = v9[1];
      v38[0] = *v9;
      v38[1] = v20;
      v38[2] = v9[2];
      [v19 setTransform:v38];
    }
    ++v4;
    v3 += 2;
  }
  while (v4 != 4);
  double dialShapeFraction = self->_dialShapeFraction;
  if (dialShapeFraction > 0.0 && dialShapeFraction < 1.0)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      if ([(NSArray *)self->_largeHourMarkerLabels count] >= 4
        && [(NSArray *)self->_mediumNumberLayers count] >= 4)
      {
        CGFloat v24 = [(NSArray *)self->_largeHourMarkerLabels objectAtIndex:i];
        CGFloat v25 = [(NSArray *)self->_mediumNumberLayers objectAtIndex:i];
        [v24 center];
        [v25 position];
        CLKInterpolateBetweenFloatsClipped();
        double v27 = v26;
        [v24 center];
        [v25 position];
        CLKInterpolateBetweenFloatsClipped();
        objc_msgSend(v24, "setCenter:", v27, v28);
        [v24 center];
        [v25 position];
        CLKInterpolateBetweenFloatsClipped();
        double v30 = v29;
        [v24 center];
        [v25 position];
        CLKInterpolateBetweenFloatsClipped();
        objc_msgSend(v25, "setCenter:", v30, v31);
        [v25 bounds];
        [v24 bounds];
        CLKInterpolateBetweenFloatsClipped();
        CGAffineTransformMakeScale(&v37, v32, v32);
        CGAffineTransform v36 = v37;
        [v24 setTransform:&v36];
        [v24 bounds];
        [v25 bounds];
        CLKInterpolateBetweenFloatsClipped();
        CGAffineTransformMakeScale(&v35, v33, v33);
        CGAffineTransform v34 = v35;
        [v25 setTransform:&v34];
      }
    }
  }
}

- (CGPoint)_ringDigitOffsetAtIndex:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  uint64_t v4 = (double *)MEMORY[0x1E4F1DAD8];
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
    case 7uLL:
    case 0xBuLL:
      goto LABEL_6;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_5;
    case 6uLL:
      unint64_t v3 = 4;
      goto LABEL_5;
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      unint64_t v3 = a3 - 3;
      goto LABEL_5;
    default:
      unint64_t v3 = 0;
LABEL_5:
      _LayoutConstants_37(self->_device, v7);
      uint64_t v4 = (double *)&v7[v3 + 1];
LABEL_6:
      double v5 = *v4;
      double v6 = v4[1];
      result.double y = v6;
      result.double x = v5;
      return result;
  }
}

- (void)setInTimeTravel:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_style >= 3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    double v6 = -[NSArray subarrayWithRange:](self->_largeHourMarkerLabels, "subarrayWithRange:", 1, 3);
    double v7 = v6;
    if (v5) {
      double v8 = 0.2;
    }
    else {
      double v8 = 1.0;
    }
    if (v4)
    {
      if (v5) {
        double v9 = 1.0;
      }
      else {
        double v9 = 0.2;
      }
      double v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      double v11 = [NSNumber numberWithDouble:v9];
      [v10 setFromValue:v11];

      [v10 setDuration:*(double *)off_1E62BD1C8];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            [v17 setAlpha:v8];
            double v18 = [v17 layer];
            [v18 addAnimation:v10 forKey:@"timeTravelFade"];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v14);
      }
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v19 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * j) setAlpha:v8];
          }
          uint64_t v20 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  [(NTKVictoryAnalogBackgroundView *)self addLogoButtonIfNeeded];
  if (a3 > 2) {
    [(NTKVictoryAnalogBackgroundView *)self _createLargeHourMarkerLabelsAndAttachToViewIfNeeded];
  }
  else {
    [(NTKVictoryAnalogBackgroundView *)self _createRingLayersIfNeeded];
  }
  [(NTKVictoryAnalogBackgroundView *)self _clearTransitionStateForStyle:a3 palette:self->_palette];
  [(NTKVictoryAnalogBackgroundView *)self setNeedsLayout];
}

- (void)setDialShape:(unint64_t)a3
{
  self->_unint64_t dialShape = a3;
  BOOL v4 = [(NTKVictoryAnalogBackgroundView *)self isCircularDial];
  double v5 = 0.0;
  if (v4) {
    double v5 = 1.0;
  }
  self->_double dialShapeFraction = v5;
  unint64_t dialShape = self->_dialShape;
  if (dialShape)
  {
    if (dialShape != 1) {
      goto LABEL_12;
    }
    [(NTKVictoryAnalogBackgroundView *)self addLogoButtonIfNeeded];
    if (![(NSArray *)self->_largeHourMarkerLabels count]) {
      [(NTKVictoryAnalogBackgroundView *)self _createLargeHourMarkerLabelsAndAttachToViewIfNeeded];
    }
    double v7 = &__block_literal_global_124;
    double v8 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__mediumNumberLayers;
  }
  else
  {
    [(NTKVictoryAnalogBackgroundView *)self addSmallLogoButtonIfNeeded];
    if (![(NSArray *)self->_mediumNumberLayers count]) {
      [(NTKVictoryAnalogBackgroundView *)self _createMediumNumberLayersIfNeededAndAttachToViewIfNeeded];
    }
    double v7 = &__block_literal_global_36;
    double v8 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__largeHourMarkerLabels;
  }
  uint64_t v9 = *v8;
  [*(id *)((char *)&self->super.super.super.isa + v9) enumerateObjectsUsingBlock:v7];
  double v10 = *(Class *)((char *)&self->super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.isa + v9) = 0;

LABEL_12:
  if ([(NTKVictoryAnalogBackgroundView *)self style] != 4) {
    [(NTKVictoryAnalogBackgroundView *)self setStyle:4];
  }
  [(NTKVictoryLogoButton *)self->_logoButton setHidden:self->_dialShape == 0];
  [(NTKVictoryLogoButton *)self->_smallLogoButton setHidden:self->_dialShape == 1];
  [(NTKVictoryAnalogBackgroundView *)self logoPositionForStyle:self->_style];
  -[NTKVictoryLogoButton setCenter:](self->_logoButton, "setCenter:");
  logoButton = self->_logoButton;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v17[0] = *MEMORY[0x1E4F1DAB8];
  long long v14 = v17[0];
  v17[1] = v15;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v13 = v18;
  [(NTKVictoryLogoButton *)logoButton setTransform:v17];
  -[NTKVictoryLogoButton setCenter:](self->_smallLogoButton, "setCenter:", self->_logoPositionCircularDial.x, self->_logoPositionCircularDial.y);
  smallLogoButton = self->_smallLogoButton;
  v16[0] = v14;
  v16[1] = v15;
  v16[2] = v13;
  [(NTKVictoryLogoButton *)smallLogoButton setTransform:v16];
  [(NTKVictoryAnalogBackgroundView *)self layoutNumbers];
}

uint64_t __47__NTKVictoryAnalogBackgroundView_setDialShape___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __47__NTKVictoryAnalogBackgroundView_setDialShape___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (BOOL)isCircularDial
{
  return self->_dialShape == 0;
}

- (void)applyTransitionFraction:(double)a3 fromDialShape:(unint64_t)a4 toDialShape:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKVictoryAnalogBackgroundView *)self setDialShape:a3];
  }
  else
  {
    [(NTKVictoryAnalogBackgroundView *)self addLogoButtonIfNeeded];
    [(NTKVictoryAnalogBackgroundView *)self addSmallLogoButtonIfNeeded];
    [(NTKVictoryLogoButton *)self->_logoButton setHidden:0];
    [(NTKVictoryLogoButton *)self->_smallLogoButton setHidden:0];
    self->_double dialShapeFraction = a3;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setAlpha:](self->_logoButton, "setAlpha:");
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setAlpha:](self->_smallLogoButton, "setAlpha:");
    CLKInterpolateBetweenFloatsClipped();
    double v8 = v7;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setCenter:](self->_logoButton, "setCenter:", v8, v9);
    CLKInterpolateBetweenFloatsClipped();
    double v11 = v10;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKVictoryLogoButton setCenter:](self->_smallLogoButton, "setCenter:", v11, v12);
    [(NTKVictoryAnalogBackgroundView *)self layoutNumbers];
    [(NTKVictoryLogoButton *)self->_smallLogoButton bounds];
    [(NTKVictoryLogoButton *)self->_logoButton bounds];
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v29, v13, v13);
    logoButton = self->_logoButton;
    CGAffineTransform v28 = v29;
    [(NTKVictoryLogoButton *)logoButton setTransform:&v28];
    [(NTKVictoryLogoButton *)self->_logoButton bounds];
    [(NTKVictoryLogoButton *)self->_smallLogoButton bounds];
    CLKInterpolateBetweenFloatsClipped();
    CGAffineTransformMakeScale(&v27, v15, v15);
    smallLogoButton = self->_smallLogoButton;
    CGAffineTransform v26 = v27;
    [(NTKVictoryLogoButton *)smallLogoButton setTransform:&v26];
    if (![(NSArray *)self->_largeHourMarkerLabels count]) {
      [(NTKVictoryAnalogBackgroundView *)self _createLargeHourMarkerLabelsAndAttachToViewIfNeeded];
    }
    if (![(NSArray *)self->_mediumNumberLayers count]) {
      [(NTKVictoryAnalogBackgroundView *)self _createMediumNumberLayersIfNeededAndAttachToViewIfNeeded];
    }
    CLKCompressFraction();
    double v18 = v17;
    CLKCompressFraction();
    double v20 = v19;
    if ([(NSArray *)self->_largeHourMarkerLabels count])
    {
      unint64_t v21 = 0;
      double v22 = 1.0 - v18;
      do
      {
        if ([(NSArray *)self->_largeHourMarkerLabels count])
        {
          long long v23 = [(NSArray *)self->_largeHourMarkerLabels objectAtIndex:v21];
          [v23 setAlpha:v22];
        }
        mediumNumberLayers = self->_mediumNumberLayers;
        if (mediumNumberLayers)
        {
          long long v25 = [(NSArray *)mediumNumberLayers objectAtIndex:v21];
          [v25 setAlpha:v20];
        }
        ++v21;
      }
      while (v21 < [(NSArray *)self->_largeHourMarkerLabels count]);
    }
  }
}

- (void)applyTransitionFraction:(double)a3 fromOlympusStyle:(unint64_t)a4 toOlympusStyle:(unint64_t)a5
{
  CLKCompressFraction();
  double v7 = v6;
  CLKInterpolateBetweenFloatsClipped();
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, v8, v8);
  [(UIView *)self->_contentView setAlpha:v7];
  CGAffineTransform v9 = v10;
  [(UIView *)self->_contentView setTransform:&v9];
}

- (id)_activeRingLayers
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  CGAffineTransform v9 = __Block_byref_object_copy__39;
  CGAffineTransform v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  ringLayers = self->_ringLayers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NTKVictoryAnalogBackgroundView__activeRingLayers__block_invoke;
  v5[3] = &unk_1E62C6F20;
  v5[4] = self;
  v5[5] = &v6;
  [(NSMutableArray *)ringLayers enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__NTKVictoryAnalogBackgroundView__activeRingLayers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "count"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  CGAffineTransform v10 = *(void **)(v9 + 40);
  if (*(unsigned char *)(v8 + 440 + a3))
  {
    id v11 = *(void **)(v8 + 472);
    if (a3)
    {
      double v12 = [NSNumber numberWithUnsignedInteger:a3];
    }
    else
    {
      double v12 = &unk_1F16E2850;
    }
    CGFloat v13 = [v11 objectForKeyedSubscript:v12];
    long long v14 = [v13 layer];
    [v10 addObject:v14];

    if (a3) {
  }
    }
  else
  {
    [*(id *)(v9 + 40) addObject:v15];
  }
}

- (id)_activeRingObjects
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__39;
  CGAffineTransform v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  ringLayers = self->_ringLayers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__NTKVictoryAnalogBackgroundView__activeRingObjects__block_invoke;
  v5[3] = &unk_1E62C6F20;
  v5[4] = self;
  v5[5] = &v6;
  [(NSMutableArray *)ringLayers enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__NTKVictoryAnalogBackgroundView__activeRingObjects__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "count"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    double v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  CGAffineTransform v10 = *(void **)(v9 + 40);
  if (*(unsigned char *)(v8 + 440 + a3))
  {
    id v11 = *(void **)(v8 + 472);
    if (a3)
    {
      double v12 = [NSNumber numberWithUnsignedInteger:a3];
    }
    else
    {
      double v12 = &unk_1F16E2850;
    }
    CGFloat v13 = [v11 objectForKeyedSubscript:v12];
    [v10 addObject:v13];

    if (a3) {
  }
    }
  else
  {
    [*(id *)(v9 + 40) addObject:v14];
  }
}

- (void)_clearTransitionStateForStyle:(unint64_t)a3 palette:(id)a4
{
  id v6 = a4;
  [(NTKVictoryAnalogBackgroundView *)self addLogoButtonIfNeeded];
  [(NSMutableDictionary *)self->_smallHourMarkerLabelsByIndex enumerateKeysAndObjectsUsingBlock:&__block_literal_global_42_1];
  [(NSMutableArray *)self->_ringLayers enumerateObjectsUsingBlock:&__block_literal_global_44_0];
  if (a3 <= 2)
  {
    double v7 = [(NSArray *)self->_activeDigitIndices objectAtIndexedSubscript:a3];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke_3;
    v40[3] = &unk_1E62C5DD8;
    v40[4] = self;
    [v7 enumerateObjectsUsingBlock:v40];
  }
  uint64_t v8 = 0;
  unint64_t v9 = 2;
  if (a3 < 2) {
    unint64_t v9 = a3;
  }
  CGAffineTransform v10 = self->_canonicalDigitStatesByStyle[v9];
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v26 = *MEMORY[0x1E4F39B10];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  do
  {
    id v11 = [(NTKVictoryAnalogBackgroundView *)self _activeRingLayers];
    double v12 = [v11 objectAtIndex:v8];

    long long v36 = v30;
    long long v37 = v29;
    long long v38 = v28;
    long long v39 = v27;
    long long v32 = v26;
    long long v33 = v25;
    long long v34 = v24;
    long long v35 = v23;
    [v12 setTransform:&v32];
    [(NTKVictoryAnalogBackgroundView *)self _setRingLayerAtIndex:v8 isDigit:v10[v8]];

    ++v8;
  }
  while (v8 != 12);
  uint64_t v13 = 0;
  if (a3 <= 2) {
    double v14 = 0.0;
  }
  else {
    double v14 = 1.0;
  }
  id v15 = (long long *)MEMORY[0x1E4F1DAB8];
  do
  {
    if ([(NTKVictoryAnalogBackgroundView *)self isCircularDial]) {
      uint64_t v16 = 464;
    }
    else {
      uint64_t v16 = 456;
    }
    double v17 = [*(id *)((char *)&self->super.super.super.isa + v16) objectAtIndex:v13];
    [v17 setAlpha:v14];
    long long v18 = v15[1];
    long long v32 = *v15;
    long long v33 = v18;
    long long v34 = v15[2];
    [v17 setTransform:&v32];

    ++v13;
  }
  while (v13 != 4);
  [(NTKVictoryAnalogBackgroundView *)self logoPositionForStyle:a3];
  -[NTKVictoryLogoButton setCenter:](self->_logoButton, "setCenter:");
  logoButton = self->_logoButton;
  v31[4] = v30;
  v31[5] = v29;
  v31[6] = v28;
  v31[7] = v27;
  v31[0] = v26;
  v31[1] = v25;
  v31[2] = v24;
  v31[3] = v23;
  [(NTKVictoryLogoButton *)logoButton setTransform3D:v31];
  [(NTKVictoryLogoButton *)self->_logoButton setAlpha:1.0];
  double v20 = self->_logoButton;
  [(NTKVictoryLogoButton *)v20 center];
  double v22 = v21;
  [(NTKVictoryLogoButton *)self->_logoButton center];
  [(NTKVictoryLogoButton *)v20 setCenter:v22];
  [(NTKVictoryAnalogBackgroundView *)self _applyPalette:v6 forStyle:a3];
}

uint64_t __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setHidden:1];
}

uint64_t __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setHidden:0];
}

void __72__NTKVictoryAnalogBackgroundView__clearTransitionStateForStyle_palette___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = *(void **)(*(void *)(a1 + 32) + 472);
  if ([v8 integerValue]) {
    BOOL v4 = v8;
  }
  else {
    BOOL v4 = &unk_1F16E2850;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  [v5 setHidden:0];
  id v6 = [v5 superview];

  if (!v6) {
    [*(id *)(a1 + 32) addSubview:v5];
  }
  double v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "objectAtIndexedSubscript:", objc_msgSend(v8, "unsignedIntegerValue"));
  [v7 setHidden:1];
}

- (CGPoint)logoPositionForStyle:(unint64_t)a3
{
  id v3 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionRing;
  if (!a3) {
    id v3 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionNoDigits;
  }
  BOOL v4 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionSmallFont;
  if (a3 < 5) {
    BOOL v4 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__logoPositionBig;
  }
  if (a3 >= 3) {
    id v3 = v4;
  }
  uint64_t v5 = (double *)((char *)self + *v3);
  double v6 = *v5;
  double v7 = v5[1];
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGSize)logoSizeForStyle:(unint64_t)a3
{
  device = self->_device;
  if (a3 > 4)
  {
    _LayoutConstants_37(device, v7);
    double v4 = *(double *)&v7[60];
    uint64_t v5 = (double *)&v8;
  }
  else
  {
    _LayoutConstants_37(device, v9);
    double v4 = v10;
    uint64_t v5 = (double *)&v11;
  }
  double v6 = *v5;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  [(NTKVictoryAnalogBackgroundView *)self _applyPalette:v5 forStyle:self->_style];
}

- (void)_applyPalette:(id)a3 forStyle:(unint64_t)a4
{
  id v6 = a3;
  long long v37 = [v6 backgroundColor];
  -[NTKVictoryAnalogBackgroundView setBackgroundColor:](self, "setBackgroundColor:");
  double v7 = [v6 dotMarkerAlpha];
  [v7 floatValue];
  float v9 = v8;

  uint64_t v10 = 0;
  if (a4 <= 2) {
    float v11 = 1.0;
  }
  else {
    float v11 = 0.0;
  }
  if (a4 <= 2) {
    float v12 = v9;
  }
  else {
    float v12 = 0.0;
  }
  do
  {
    uint64_t v13 = [(NSMutableArray *)self->_ringLayers objectAtIndex:v10];
    BOOL v14 = self->_ringLayerIsDigit[v10];
    id v15 = [NSNumber numberWithUnsignedInteger:v10];
    if (v14)
    {
      uint64_t v16 = [v6 numberColorAtIndex:v15];
      float v17 = v11;
    }
    else
    {
      uint64_t v16 = [v6 dotMarkerColorAtIndex:v15];
      float v17 = v12;
    }
    id v18 = v16;
    uint64_t v19 = [v18 CGColor];

    [v13 setContentsMultiplyColor:v19];
    *(float *)&double v20 = v17;
    [v13 setOpacity:v20];

    ++v10;
  }
  while (v10 != 12);
  if ([(NSArray *)self->_largeHourMarkerLabels count])
  {
    unint64_t v21 = 0;
    do
    {
      double v22 = [(NSArray *)self->_largeHourMarkerLabels objectAtIndex:v21];
      if (v21)
      {
        long long v23 = [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:v21];
        long long v24 = [v6 numberColorAtIndex:v23];

        [v22 setFillColor:v24];
      }
      else
      {
        long long v25 = [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:0];
        long long v24 = [v6 numberColorAtIndex:v25];

        long long v26 = NSNumber;
        long long v27 = [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:0];
        long long v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerValue") + 1);
        long long v29 = [v6 numberColorAtIndex:v28];

        objc_msgSend(v22, "setFillColor:inRange:", v24, 0, 1);
        objc_msgSend(v22, "setFillColor:inRange:", v29, 1, 1);
      }
      ++v21;
    }
    while (v21 < [(NSArray *)self->_largeHourMarkerLabels count]);
  }
  if ([(NSArray *)self->_mediumNumberLayers count])
  {
    unint64_t v30 = 0;
    do
    {
      double v31 = [(NSArray *)self->_mediumNumberLayers objectAtIndex:v30];
      long long v32 = [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:v30];
      long long v33 = [v6 numberColorAtIndex:v32];

      [v31 setFillColor:v33];
      ++v30;
    }
    while (v30 < [(NSArray *)self->_mediumNumberLayers count]);
  }
  smallHourMarkerLabelsByIndedouble x = self->_smallHourMarkerLabelsByIndex;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __57__NTKVictoryAnalogBackgroundView__applyPalette_forStyle___block_invoke;
  _OWORD v38[3] = &unk_1E62C6ED8;
  id v39 = v6;
  id v35 = v6;
  [(NSMutableDictionary *)smallHourMarkerLabelsByIndex enumerateKeysAndObjectsUsingBlock:v38];
  long long v36 = [v35 logo];
  [(NTKVictoryLogoButton *)self->_logoButton setTintColor:v36];
  [(NTKVictoryLogoButton *)self->_smallLogoButton setTintColor:v36];
}

void __57__NTKVictoryAnalogBackgroundView__applyPalette_forStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  double v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a2, "unsignedIntegerValue") % 0xCuLL);
  id v9 = [v4 numberColorAtIndex:v7];

  [v6 setFillColor:v9];
  float v8 = [v6 layer];

  [v8 setContentsMultiplyColor:0];
}

- (id)digitForLargeNumberAtIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return (id)qword_1E62C7010[a3];
  }
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5 style:(unint64_t)a6
{
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5 style:(unint64_t)a6 animateElements:(BOOL)a7
{
  BOOL v79 = a7;
  id v10 = a4;
  id v11 = a5;
  float v12 = [v10 dotMarkerAlpha];
  [v12 floatValue];

  uint64_t v13 = [v11 dotMarkerAlpha];
  [v13 floatValue];

  v83 = v10;
  BOOL v14 = [v10 backgroundColor];
  v84 = v11;
  uint64_t v15 = [v11 backgroundColor];
  if (([v14 isEqual:v15] & 1) == 0)
  {
    uint64_t v16 = NTKInterpolateBetweenColors();
    [(NTKVictoryAnalogBackgroundView *)self setBackgroundColor:v16];
  }
  v73 = v14;
  if (a6 > 2)
  {
    BOOL v18 = [(NTKVictoryAnalogBackgroundView *)self isCircularDial];
    uint64_t v19 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__largeHourMarkerLabels;
    if (v18) {
      uint64_t v19 = &OBJC_IVAR___NTKVictoryAnalogBackgroundView__mediumNumberLayers;
    }
    v81 = &__block_literal_global_49_0;
    id v82 = *(id *)((char *)&self->super.super.super.isa + *v19);
    v80 = (uint64_t (**)(void *, void))&__block_literal_global_51_0;
    double v17 = 0.174999997;
    double v71 = 0.150000006;
    float v70 = 0.1;
  }
  else
  {
    id v82 = [(NTKVictoryAnalogBackgroundView *)self _activeRingObjects];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke;
    aBlock[3] = &unk_1E62C6F88;
    aBlock[4] = self;
    v81 = _Block_copy(aBlock);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_2;
    v94[3] = &unk_1E62C6FB0;
    v94[4] = self;
    v80 = (uint64_t (**)(void *, void))_Block_copy(v94);
    double v71 = 0.5;
    float v70 = 0.0;
    double v17 = 0.0579999983;
  }
  v72 = (void *)v15;
  uint64_t v20 = [v82 count];
  unint64_t v21 = a6;
  if (v20)
  {
    uint64_t v22 = 0;
    unint64_t v23 = 0x1E4F28000uLL;
    uint64_t v78 = v20;
    v77 = self;
    do
    {
      if (v22) {
        uint64_t v24 = v22;
      }
      else {
        uint64_t v24 = v20;
      }
      [(NTKVictoryAnalogBackgroundView *)self _transitionProgressForDigitAtIndex:v24 - 1 overallProgress:a3 delayPerDigit:v17 digitTransitionLength:0.300000012];
      float v26 = v25;
      if ((float)((float)(v26 * 2.0) + -0.5) <= 1.0) {
        float v27 = (float)(v26 * 2.0) + -0.5;
      }
      else {
        float v27 = 1.0;
      }
      [(NTKVictoryAnalogBackgroundView *)self _elementScaleForTransitionProgress:v26 initialScale:1.0 middleScale:((__n128 (*)(void *, uint64_t))v81[2])(v81, v22).n128_f32[0] finalScale:1.0];
      CGFloat v29 = v28;
      unint64_t v30 = [v82 objectAtIndex:v22];
      double v31 = [*(id *)(v23 + 3792) numberWithUnsignedInteger:v22];
      v86 = [v83 dotMarkerColorAtIndex:v31];

      long long v32 = [*(id *)(v23 + 3792) numberWithUnsignedInteger:v22];
      v85 = [v84 dotMarkerColorAtIndex:v32];

      if (v21 == 3) {
        [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:v22];
      }
      else {
      long long v33 = [*(id *)(v23 + 3792) numberWithUnsignedInteger:v22];
      }
      float v34 = fmaxf(v27, 0.0);
      id v35 = [v83 numberColorAtIndex:v33];
      long long v36 = [v84 numberColorAtIndex:v33];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v38 = v30;
      if (isKindOfClass)
      {
        if (v79)
        {
          CATransform3DMakeScale(&v93, v29, v29, v29);
          [v38 setTransform:&v93];
        }
        int v39 = v80[2](v80, v22);
        if (v39) {
          CGRect v40 = v86;
        }
        else {
          CGRect v40 = v35;
        }
        if (v39) {
          long long v41 = v85;
        }
        else {
          long long v41 = v36;
        }
        objc_msgSend(v38, "setContentsMultiplyColor:", -[NTKVictoryAnalogBackgroundView _layerTransitionColorFromColor:toColor:amount:](self, "_layerTransitionColorFromColor:toColor:amount:", v40, v41, v34));
        if (v21 <= 2)
        {
          CLKInterpolateBetweenFloatsClipped();
          *(float *)&double v42 = v42;
          [v38 setOpacity:v42];
        }
      }
      else
      {
        if (v79)
        {
          CGAffineTransformMakeScale(&v92, v29, v29);
          CGAffineTransform v91 = v92;
          [v38 setTransform:&v91];
        }
        int v43 = v80[2](v80, v22);
        if (v21 != 3 || v22)
        {
          if (v43) {
            v57 = v86;
          }
          else {
            v57 = v35;
          }
          if (v43) {
            v58 = v85;
          }
          else {
            v58 = v36;
          }
          v59 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithCGColor:", -[NTKVictoryAnalogBackgroundView _layerTransitionColorFromColor:toColor:amount:](self, "_layerTransitionColorFromColor:toColor:amount:", v57, v58, v34));
          [v38 setFillColor:v59];

          unint64_t v21 = a6;
          if (a6 <= 2)
          {
            CLKInterpolateBetweenFloatsClipped();
            objc_msgSend(v38, "setAlpha:");
          }
        }
        else
        {
          long long v44 = [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:0];
          [v83 numberColorAtIndex:v44];
          long long v45 = v75 = v35;

          long long v46 = NSNumber;
          long long v47 = [(NTKVictoryAnalogBackgroundView *)self digitForLargeNumberAtIndex:0];
          long long v48 = objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v47, "integerValue") + 1);
          v74 = [v83 numberColorAtIndex:v48];

          long long v49 = [(NTKVictoryAnalogBackgroundView *)v77 digitForLargeNumberAtIndex:0];
          long long v50 = [v84 numberColorAtIndex:v49];

          objc_super v51 = NSNumber;
          v52 = [(NTKVictoryAnalogBackgroundView *)v77 digitForLargeNumberAtIndex:0];
          v53 = objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "integerValue") + 1);
          v54 = [v84 numberColorAtIndex:v53];

          v55 = NTKInterpolateBetweenColors();
          v56 = NTKInterpolateBetweenColors();
          objc_msgSend(v38, "setFillColor:inRange:", v55, 0, 1);
          objc_msgSend(v38, "setFillColor:inRange:", v56, 1, 1);

          self = v77;
          id v35 = v75;
          unint64_t v21 = a6;
        }
      }

      ++v22;
      uint64_t v20 = v78;
      unint64_t v23 = 0x1E4F28000;
    }
    while (v78 != v22);
  }
  double v60 = (a3 - v71) / 0.150000006;
  if (v60 > 1.0) {
    double v60 = 1.0;
  }
  float v61 = fmax(v60, 0.0);
  if (v79)
  {
    float v62 = v61 + v61;
    if (v61 >= 0.5) {
      float v62 = 1.0 - (float)((float)(v61 + -0.5) + (float)(v61 + -0.5));
    }
    CGFloat v63 = (float)(v70 * v62) + 1.0;
    CATransform3DMakeScale(&v90, v63, v63, v63);
    logoButton = self->_logoButton;
    CATransform3D v89 = v90;
    [(NTKVictoryLogoButton *)logoButton setTransform3D:&v89];
    CATransform3DMakeScale(&v88, v63, v63, v63);
    smallLogoButton = self->_smallLogoButton;
    CATransform3D v87 = v88;
    [(NTKVictoryLogoButton *)smallLogoButton setTransform3D:&v87];
  }
  v66 = [v83 logo];
  v67 = [v84 logo];
  v68 = NTKInterpolateBetweenColors();
  [(NTKVictoryLogoButton *)self->_logoButton setTintColor:v68];

  v69 = NTKInterpolateBetweenColors();
  [(NTKVictoryLogoButton *)self->_smallLogoButton setTintColor:v69];
}

float __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke(uint64_t a1, uint64_t a2)
{
  float result = 1.45;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 440 + a2)) {
    return 2.5;
  }
  return result;
}

BOOL __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(unsigned char *)(*(void *)(a1 + 32) + 440 + a2) == 0;
}

float __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_3()
{
  return 1.2;
}

uint64_t __102__NTKVictoryAnalogBackgroundView_applyTransitionFraction_fromPalette_toPalette_style_animateElements___block_invoke_4()
{
  return 0;
}

- (CGColor)_layerTransitionColorFromColor:(id)a3 toColor:(id)a4 amount:(double)a5
{
  id v6 = a3;
  id v7 = a4;
  if (CLKFloatEqualsFloat())
  {
    float v8 = v6;
  }
  else
  {
    if (!CLKFloatEqualsFloat())
    {
      NTKInterpolateBetweenColors();
      id v10 = objc_claimAutoreleasedReturnValue();
      id v9 = (CGColor *)[v10 CGColor];

      goto LABEL_7;
    }
    float v8 = v7;
  }
  id v9 = (CGColor *)[v8 CGColor];
LABEL_7:

  return v9;
}

- (double)_transitionProgressForDigitAtIndex:(unint64_t)a3 overallProgress:(double)a4 delayPerDigit:(double)a5 digitTransitionLength:(double)a6
{
  double v6 = (a4 - a5 * (double)a3) / a6;
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  return fmax(v6, 0.0);
}

- (double)_elementScaleForTransitionProgress:(double)a3 initialScale:(double)a4 middleScale:(double)a5 finalScale:(double)a6
{
  if (a3 >= 0.5) {
    double v6 = 1.0 - (a3 + -0.5 + a3 + -0.5);
  }
  else {
    double v6 = a3 + a3;
  }
  *(float *)&double v6 = v6;
  [(CAMediaTimingFunction *)self->_transitionTimingFunction _solveForInput:v6];
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (void)willBeginEditing
{
  [(NTKVictoryAnalogBackgroundView *)self _createRingLayersIfNeeded];
  if (![(NTKVictoryAnalogBackgroundView *)self isCircularDial]) {
    [(NTKVictoryAnalogBackgroundView *)self _createLargeHourMarkerLabelsAndAttachToViewIfNeeded];
  }
  if (!self->_transitionTimingFunction)
  {
    LODWORD(v3) = 1051260355;
    LODWORD(v4) = 1059648963;
    LODWORD(v5) = 1.0;
    double v6 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :0.0 :v4 :v5];
    transitionTimingFunction = self->_transitionTimingFunction;
    self->_transitionTimingFunction = v6;
  }
  [(NTKVictoryAnalogBackgroundView *)self _clearTransitionStateForStyle:self->_style palette:self->_palette];
  [(NTKVictoryAnalogBackgroundView *)self setNeedsLayout];
}

- (void)_setRingLayerAtIndex:(unint64_t)a3 isDigit:(BOOL)a4
{
  BOOL v4 = a4;
  self->_ringLayerIsDigit[a3] = a4;
  -[NSMutableArray objectAtIndex:](self->_ringLayers, "objectAtIndex:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(NTKVictoryAnalogBackgroundView *)self _dotImage];
  objc_msgSend(v11, "setContents:", objc_msgSend(v6, "CGImage"));
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v6 size];
  objc_msgSend(v11, "setBounds:", v7, v8, v9, v10);
  [v11 setHidden:v4];
}

- (void)_createRingLayersIfNeeded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_ringLayers)
  {
    double v3 = [(NTKVictoryAnalogBackgroundView *)self _createAndAddLayersWithCount:12];
    ringLayers = self->_ringLayers;
    self->_ringLayers = v3;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v5 = self->_ringLayers;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) setOpaque:1];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [(NTKVictoryAnalogBackgroundView *)self _applyPalette:self->_palette forStyle:self->_style];
  }
  if (!self->_smallHourMarkerLabelsByIndex)
  {
    double v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
    smallHourMarkerLabelsByIndedouble x = self->_smallHourMarkerLabelsByIndex;
    self->_smallHourMarkerLabelsByIndedouble x = v10;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [&unk_1F16EA1B0 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(&unk_1F16EA1B0);
          }
          uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          double v17 = [(NTKVictoryAnalogBackgroundView *)self _createSmallHourMarkerLabelForIndex:v16];
          BOOL v18 = [v16 stringValue];
          [v17 setText:v18];

          [v17 sizeToFit];
          [(NSMutableDictionary *)self->_smallHourMarkerLabelsByIndex setObject:v17 forKeyedSubscript:v16];
        }
        uint64_t v13 = [&unk_1F16EA1B0 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }
  }
}

- (unint64_t)_digitForIndex:(unint64_t)a3
{
  uint64_t v3 = 12;
  if (a3) {
    uint64_t v3 = 0;
  }
  return v3 + 3 * a3;
}

- (void)_createMediumNumberLayersIfNeededAndAttachToViewIfNeeded
{
  mediumNumberLayers = self->_mediumNumberLayers;
  if (!mediumNumberLayers)
  {
    _LayoutConstants_37(self->_device, v9);
    BOOL v4 = [(NTKVictoryAnalogBackgroundView *)self _createHourMarkerLabelsWithFontSize:v9[26]];
    double v5 = self->_mediumNumberLayers;
    self->_mediumNumberLayers = v4;

    [(NTKVictoryAnalogBackgroundView *)self _applyPalette:self->_palette forStyle:self->_style];
    mediumNumberLayers = self->_mediumNumberLayers;
  }
  if ([(NSArray *)mediumNumberLayers count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(NSArray *)self->_mediumNumberLayers objectAtIndex:v6];
      uint64_t v8 = [v7 superview];

      if (v8) {
        [v7 removeFromSuperview];
      }
      [(UIView *)self->_contentView addSubview:v7];

      ++v6;
    }
    while (v6 < [(NSArray *)self->_mediumNumberLayers count]);
  }
}

- (void)_createLargeHourMarkerLabelsAndAttachToViewIfNeeded
{
  largeHourMarkerLabels = self->_largeHourMarkerLabels;
  if (!largeHourMarkerLabels)
  {
    memset(v11, 0, sizeof(v11));
    memset(v10, 0, sizeof(v10));
    _LayoutConstants_37(self->_device, v10);
    if (self->_style <= 4) {
      BOOL v4 = (double *)v11;
    }
    else {
      BOOL v4 = (double *)v11 + 1;
    }
    double v5 = [(NTKVictoryAnalogBackgroundView *)self _createHourMarkerLabelsWithFontSize:*v4];
    unint64_t v6 = self->_largeHourMarkerLabels;
    self->_largeHourMarkerLabels = v5;

    [(NTKVictoryAnalogBackgroundView *)self _applyPalette:self->_palette forStyle:self->_style];
    largeHourMarkerLabels = self->_largeHourMarkerLabels;
  }
  if ([(NSArray *)largeHourMarkerLabels count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(NSArray *)self->_largeHourMarkerLabels objectAtIndex:v7];
      double v9 = [v8 superview];

      if (v9) {
        [v8 removeFromSuperview];
      }
      [(UIView *)self->_contentView addSubview:v8];

      ++v7;
    }
    while (v7 < [(NSArray *)self->_largeHourMarkerLabels count]);
  }
}

- (id)_createHourMarkerLabelsWithFontSize:(double)a3
{
  double v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  for (uint64_t i = 0; i != 4; ++i)
  {
    unint64_t v7 = objc_alloc_init(NTKVictoryLabel);
    [(NTKVictoryLabel *)v7 setAdditionalPaddingInsets:5.0];
    [(NTKVictoryLabel *)v7 setTextAlignment:1];
    uint64_t v8 = +[NTKVictoryLabel victoryFontWithSize:0 style:a3];
    [(CLKUIColoringLabel *)v7 setFont:v8];

    double v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[NTKVictoryAnalogBackgroundView _digitForIndex:](self, "_digitForIndex:", i));
    double v10 = [v9 stringValue];
    [(NTKVictoryLabel *)v7 setText:v10];

    [(NTKVictoryLabel *)v7 sizeToFit];
    [v5 addObject:v7];
  }
  return v5;
}

- (id)_createSmallHourMarkerLabelForIndex:(id)a3
{
  id v4 = a3;
  double v5 = objc_alloc_init(NTKVictoryLabel);
  [(NTKVictoryLabel *)v5 setAdditionalPaddingInsets:10.0];
  [(NTKVictoryLabel *)v5 setTextAlignment:1];
  _LayoutConstants_37(self->_device, v9);
  unint64_t v6 = +[NTKVictoryLabel victoryFontWithSize:0 style:v9[27]];
  [(CLKUIColoringLabel *)v5 setFont:v6];

  unint64_t v7 = [v4 stringValue];

  [(NTKVictoryLabel *)v5 setText:v7];
  [(NTKVictoryLabel *)v5 sizeToFit];
  return v5;
}

- (id)_createAndAddLayersWithCount:(unint64_t)a3
{
  double v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = [(id)objc_opt_class() _disabledLayerActions];
  if (a3)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      id v11 = [MEMORY[0x1E4F39BE8] layer];
      [v11 setActions:v6];
      objc_msgSend(v11, "setBounds:", v7, v8, v9, v10);
      uint64_t v12 = [(UIView *)self->_contentView layer];
      [v12 addSublayer:v11];

      [v5 addObject:v11];
      --a3;
    }
    while (a3);
  }

  return v5;
}

- (UIImage)logoImage
{
  logoImage = self->_logoImage;
  if (!logoImage) {
    NTKImageNamed(@"victoryNTK-fullscreen-logo");
  }
  uint64_t v3 = logoImage;
  return v3;
}

- (id)_circularDialLogoImage
{
}

- (id)_dotImage
{
  dotImage = self->_dotImage;
  if (!dotImage)
  {
    _LayoutConstants_37(self->_device, v13);
    double v4 = v13[0];
    [(CLKDevice *)self->_device screenScale];
    CGFloat v6 = v5 + v5;
    v15.double width = v4;
    v15.double height = v4;
    UIGraphicsBeginImageContextWithOptions(v15, 1, v6);
    double v7 = [MEMORY[0x1E4FB1618] blackColor];
    [v7 setFill];

    v16.origin.double x = 0.0;
    v16.origin.double y = 0.0;
    v16.size.double width = v4;
    v16.size.double height = v4;
    UIRectFill(v16);
    double v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [v8 setFill];

    double v9 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, v4, v4);
    [v9 fill];

    UIGraphicsGetImageFromCurrentImageContext();
    double v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v11 = self->_dotImage;
    self->_dotImage = v10;

    UIGraphicsEndImageContext();
    dotImage = self->_dotImage;
  }
  return dotImage;
}

+ (id)_disabledLayerActions
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA98] null];
  v5[0] = @"contents";
  v5[1] = @"contentsMultiplyColor";
  v6[0] = v2;
  v6[1] = v2;
  v5[2] = @"transform";
  v5[3] = @"bounds";
  v6[2] = v2;
  v6[3] = v2;
  v5[4] = @"position";
  v5[5] = @"opacity";
  v6[4] = v2;
  v6[5] = v2;
  void v5[6] = @"hidden";
  v6[6] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];

  return v3;
}

- (NTKVictoryAnalogBackgroundColorPalette)palette
{
  return self->_palette;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)dialShape
{
  return self->_dialShape;
}

- (void)setLogoImage:(id)a3
{
}

- (NTKVictoryAnalogBackgroundViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKVictoryAnalogBackgroundViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_smallLogoButton, 0);
  objc_storeStrong((id *)&self->_logoButton, 0);
  objc_storeStrong((id *)&self->_transitionTimingFunction, 0);
  objc_storeStrong((id *)&self->_activeDigitIndices, 0);
  objc_storeStrong((id *)&self->_smallHourMarkerLabelsByIndex, 0);
  objc_storeStrong((id *)&self->_mediumNumberLayers, 0);
  objc_storeStrong((id *)&self->_largeHourMarkerLabels, 0);
  objc_storeStrong((id *)&self->_ringLayers, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_dotImage, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end