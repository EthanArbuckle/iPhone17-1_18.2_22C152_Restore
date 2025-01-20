@interface NTKTimeTravelModuleView
+ (double)_actualCornerRadiusForDevice:(id)a3;
+ (double)_defaultHeightForDevice:(id)a3;
+ (double)cornerRadius;
+ (id)timeTravelColor;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKTimeTravelModuleView)initWithMaximumWidth:(double)a3;
- (NTKTimeTravelModuleViewTapClient)tapDelegate;
- (id)_formatDateStringForIntervalBetweenReferenceDate:(id)a3 andOverrideDate:(id)a4;
- (void)_layoutContentView;
- (void)_setupBorder;
- (void)layoutSubviews;
- (void)prepareToAppear;
- (void)scrubToDate:(id)a3;
- (void)setTapDelegate:(id)a3;
@end

@implementation NTKTimeTravelModuleView

- (NTKTimeTravelModuleView)initWithMaximumWidth:(double)a3
{
  v55.receiver = self;
  v55.super_class = (Class)NTKTimeTravelModuleView;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[NTKModuleView initWithFrame:](&v55, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v10 = [(NTKModuleView *)v8 device];
    uint64_t v11 = [v10 sizeClass];

    if (v11) {
      double v12 = 16.0;
    }
    else {
      double v12 = 15.0;
    }
    v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    v14 = [v13 objectForKey:*MEMORY[0x1E4F1C438]];
    v15 = [&unk_1F16E8980 objectForKey:v14];

    double v16 = v12;
    if (v15)
    {
      v17 = [v15 objectAtIndex:v11 != 0];
      [v17 floatValue];
      double v16 = v18;
    }
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v19;

    [(UIView *)v9->_backgroundView setUserInteractionEnabled:0];
    [(NTKTimeTravelModuleView *)v9 insertSubview:v9->_backgroundView atIndex:0];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
    timeScrubDifferenceLabel = v9->_timeScrubDifferenceLabel;
    v9->_timeScrubDifferenceLabel = (UILabel *)v21;

    v23 = v9->_timeScrubDifferenceLabel;
    double v24 = *MEMORY[0x1E4FB09D0];
    v25 = [MEMORY[0x1E4F19A50] systemFontOfSize:v12 weight:*MEMORY[0x1E4FB09D0]];
    v26 = [v25 CLKFontWithMonospacedNumbers];
    v27 = [v26 CLKFontWithAlternativePunctuation];
    [(UILabel *)v23 setFont:v27];

    [(UILabel *)v9->_timeScrubDifferenceLabel setTextAlignment:1];
    v28 = v9->_timeScrubDifferenceLabel;
    v29 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v28 setTextColor:v29];

    v30 = [(NTKModuleView *)v9 contentView];
    [v30 addSubview:v9->_timeScrubDifferenceLabel];

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
    timeScrubNowLabel = v9->_timeScrubNowLabel;
    v9->_timeScrubNowLabel = (UILabel *)v31;

    v33 = v9->_timeScrubNowLabel;
    v34 = [MEMORY[0x1E4F19A50] systemFontOfSize:v16 weight:v24];
    [(UILabel *)v33 setFont:v34];

    [(UILabel *)v9->_timeScrubNowLabel setTextAlignment:1];
    v35 = v9->_timeScrubNowLabel;
    v36 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v35 setTextColor:v36];

    v37 = [(NTKModuleView *)v9 contentView];
    [v37 addSubview:v9->_timeScrubNowLabel];

    v38 = v9->_timeScrubNowLabel;
    v39 = NTKClockFaceLocalizedString(@"TIME_TRAVEL_DATE_NOW", @"Text shown when Time Travel reaches the current time");
    [(UILabel *)v38 setText:v39];

    [(UILabel *)v9->_timeScrubNowLabel sizeToFit];
    v9->_shouldUseNowText = 1;
    if ((CLKFloatEqualsFloat() & 1) == 0)
    {
      v40 = objc_opt_class();
      v41 = [(NTKModuleView *)v9 device];
      [v40 _actualCornerRadiusForDevice:v41];
      double v43 = a3 + v42 * -2.0;

      [(UILabel *)v9->_timeScrubNowLabel bounds];
      if (v44 > v43) {
        v9->_shouldUseNowText = 0;
      }
    }
    v9->_nowLabelCenterY = 0.0;
    v45 = [(id)objc_opt_class() timeTravelColor];
    [(UIView *)v9->_backgroundView setBackgroundColor:v45];
    v46 = objc_opt_class();
    v47 = [(NTKModuleView *)v9 device];
    [v46 _actualCornerRadiusForDevice:v47];
    double v49 = v48;

    v50 = [(UIView *)v9->_backgroundView layer];
    [v50 setCornerRadius:v49];

    v51 = NTKColorByPremultiplyingAlpha(v45, 0.82);
    [(NTKModuleView *)v9 setHighlightBackgroundColor:v51];

    uint64_t v52 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    cal = v9->_cal;
    v9->_cal = (NSCalendar *)v52;

    [(NTKTimeTravelModuleView *)v9 _setupBorder];
  }
  return v9;
}

- (void)prepareToAppear
{
  [(UILabel *)self->_timeScrubDifferenceLabel setHidden:1];
  timeScrubNowLabel = self->_timeScrubNowLabel;
  [(UILabel *)timeScrubNowLabel setHidden:0];
}

+ (id)timeTravelColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.239 green:0.949 blue:0.937 alpha:1.0];
}

+ (double)cornerRadius
{
  return 0.0;
}

+ (double)_actualCornerRadiusForDevice:(id)a3
{
  id v4 = a3;
  [a1 _defaultHeightForDevice:v4];
  [a1 _defaultHeightForDevice:v4];
  CLKValueForDeviceMetrics();
  double v6 = v5;

  return v6;
}

+ (double)_defaultHeightForDevice:(id)a3
{
  CLKValueForDeviceMetrics();
  return result;
}

- (void)_setupBorder
{
  if (!self->_borderLayer)
  {
    v3 = [MEMORY[0x1E4F39BE8] layer];
    borderLayer = self->_borderLayer;
    self->_borderLayer = v3;

    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    -[CALayer setBackgroundColor:](self->_borderLayer, "setBackgroundColor:", [v5 CGColor]);

    double v6 = objc_opt_class();
    double v7 = [(NTKModuleView *)self device];
    [v6 _actualCornerRadiusForDevice:v7];
    [(CALayer *)self->_borderLayer setCornerRadius:v8 + 1.0];

    id v9 = [(NTKTimeTravelModuleView *)self layer];
    [v9 insertSublayer:self->_borderLayer atIndex:0];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKTimeTravelModuleView;
  [(NTKModuleView *)&v4 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(NTKTimeTravelModuleView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  [(NTKTimeTravelModuleView *)self bounds];
  CGRect v6 = CGRectInset(v5, -1.0, -1.0);
  -[CALayer setFrame:](self->_borderLayer, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void)_layoutContentView
{
  [(UILabel *)self->_timeScrubDifferenceLabel sizeToFit];
  [(NTKTimeTravelModuleView *)self bounds];
  v3 = [(NTKModuleView *)self device];
  uint64_t v4 = [v3 sizeClass];

  [(UILabel *)self->_timeScrubDifferenceLabel bounds];
  CGRect v5 = [(NTKModuleView *)self device];
  CLKRectCenteredAboutPointForDevice();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[UILabel ntk_setBoundsAndPositionFromFrame:](self->_timeScrubDifferenceLabel, "ntk_setBoundsAndPositionFromFrame:", v7, v9, v11, v13);
  if (self->_nowLabelCenterY == 0.0)
  {
    double v14 = 15.0;
    if (!v4) {
      double v14 = 14.0;
    }
    [(UILabel *)self->_timeScrubNowLabel _setFirstLineBaselineFrameOriginY:v14];
    [(UILabel *)self->_timeScrubNowLabel center];
    self->_nowLabelCenterY = v15;
  }
  [(UILabel *)self->_timeScrubNowLabel bounds];
  double v16 = [(NTKModuleView *)self device];
  CLKRectCenteredAboutPointForDevice();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  timeScrubNowLabel = self->_timeScrubNowLabel;
  -[UILabel ntk_setBoundsAndPositionFromFrame:](timeScrubNowLabel, "ntk_setBoundsAndPositionFromFrame:", v18, v20, v22, v24);
}

- (void)scrubToDate:(id)a3
{
  NTKRoundDateDownToNearestMinute();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if ((-[NSDate isEqual:](self->_date, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_date, obj);
    uint64_t v4 = +[NTKDate faceDate];
    CGRect v5 = NTKRoundDateDownToNearestMinute();

    double v6 = [(NTKTimeTravelModuleView *)self _formatDateStringForIntervalBetweenReferenceDate:v5 andOverrideDate:obj];
    [(UILabel *)self->_timeScrubDifferenceLabel setText:v6];
    [(UILabel *)self->_timeScrubDifferenceLabel setHidden:v6 == 0];
    [(UILabel *)self->_timeScrubNowLabel setHidden:v6 != 0];
    [(NTKTimeTravelModuleView *)self sizeToFit];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(UILabel *)self->_timeScrubDifferenceLabel isHidden])
  {
    [(UILabel *)self->_timeScrubNowLabel bounds];
  }
  else
  {
    [(UILabel *)self->_timeScrubDifferenceLabel sizeToFit];
    -[UILabel sizeThatFits:](self->_timeScrubDifferenceLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  uint64_t v4 = objc_opt_class();
  CGRect v5 = [(NTKModuleView *)self device];
  [v4 _actualCornerRadiusForDevice:v5];

  double v6 = [(NTKModuleView *)self device];
  CLKCeilForDevice();
  double v8 = v7;

  double v9 = [(NTKModuleView *)self device];
  +[NTKTimeTravelModuleView _defaultHeightForDevice:v9];
  double v11 = v10;

  double v12 = v8;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKTimeTravelModuleView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);
  [WeakRetained timeTravelModuleTouchInsets];
  CGFloat v17 = v10 + v16;
  CGFloat v20 = v12 - (v18 + v19);
  v25.size.height = v14 - (v16 + v21);
  v25.origin.CGFloat x = v8 + v18;
  v25.origin.CGFloat y = v17;
  v25.size.width = v20;
  v24.CGFloat x = x;
  v24.CGFloat y = y;
  BOOL v22 = CGRectContainsPoint(v25, v24);

  return v22;
}

- (id)_formatDateStringForIntervalBetweenReferenceDate:(id)a3 andOverrideDate:(id)a4
{
  [a4 timeIntervalSinceDate:a3];
  double v6 = v5;
  double v7 = fabs(v5);
  if (v7 < 60.0 && self->_shouldUseNowText)
  {
    double v8 = 0;
  }
  else
  {
    offsetDateFormatter = self->_offsetDateFormatter;
    if (!offsetDateFormatter)
    {
      double v10 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
      double v11 = self->_offsetDateFormatter;
      self->_offsetDateFormatter = v10;

      [(NSDateComponentsFormatter *)self->_offsetDateFormatter setMaximumUnitCount:2];
      [(NSDateComponentsFormatter *)self->_offsetDateFormatter setFormattingContext:2];
      [(NSDateComponentsFormatter *)self->_offsetDateFormatter setAllowedUnits:96];
      [(NSDateComponentsFormatter *)self->_offsetDateFormatter setUnitsStyle:0];
      [(NSDateComponentsFormatter *)self->_offsetDateFormatter setZeroFormattingBehavior:0x10000];
      offsetDateFormatter = self->_offsetDateFormatter;
    }
    double v12 = [(NSDateComponentsFormatter *)offsetDateFormatter stringFromTimeInterval:v7];
    double v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    double v14 = [v13 objectForKey:*MEMORY[0x1E4F1C438]];
    if (CLKLocaleCurrentNumberSystem() == 1) {
      double v15 = @"\u200F";
    }
    else {
      double v15 = &stru_1F1635E90;
    }
    double v16 = @"-";
    if (v6 >= 0.0) {
      double v16 = @"+";
    }
    CGFloat v17 = v16;
    if ([v14 isEqualToString:@"en"])
    {
      uint64_t v18 = [v12 uppercaseStringWithLocale:v13];

      double v12 = (void *)v18;
    }
    double v8 = [NSString stringWithFormat:@"%@%@%@", v15, v17, v12];
  }
  return v8;
}

- (void)setTapDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_tapDelegate);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_tapDelegate);
      [(NTKTimeTravelModuleView *)self removeTarget:v7 action:0 forControlEvents:0xFFFFFFFFLL];
    }
    id v8 = objc_storeWeak((id *)&self->_tapDelegate, obj);
    int v9 = [obj conformsToProtocol:&unk_1FCE1B690];

    double v5 = obj;
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_tapDelegate);
      [(NTKTimeTravelModuleView *)self addTarget:v10 action:sel_performTimeTravelModuleTapAction forControlEvents:64];

      double v5 = obj;
    }
  }
}

- (NTKTimeTravelModuleViewTapClient)tapDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);
  return (NTKTimeTravelModuleViewTapClient *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapDelegate);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_cal, 0);
  objc_storeStrong((id *)&self->_offsetDateFormatter, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeScrubNowLabel, 0);
  objc_storeStrong((id *)&self->_timeScrubDifferenceLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end