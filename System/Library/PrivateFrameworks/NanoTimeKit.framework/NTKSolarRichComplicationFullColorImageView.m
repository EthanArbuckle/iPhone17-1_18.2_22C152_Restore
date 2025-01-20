@interface NTKSolarRichComplicationFullColorImageView
- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3;
- (BOOL)usingIdealizedTime;
- (CLKMonochromeFilterProvider)filterProvider;
- (CLLocation)location;
- (NSDate)timeTravelDate;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)initFullColorImageViewWithDevice:(id)a3 family:(int64_t)a4;
- (void)_dateDidUpdate;
- (void)_didReceiveSignificantTimeChangeNotification;
- (void)_didReceiveTimeZoneDidChangeNotification;
- (void)_setSolarPathNeedsUpdate;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_updateGradientBackgroundWithYPosition:(double)a3 xPercentage:(double)a4 topDistanceAboveHorizonLine:(double)a5 bottomDistanceBelowHorizonLine:(double)a6;
- (void)_updateSolarDiskWithUsingIdealizedTime:(BOOL)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5;
- (void)_updateSolarPathWithAnimated:(BOOL)a3;
- (void)_updateWaypoints;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)setTimeTravelDate:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
- (void)updateWithLocation:(id)a3 useIdealizedTime:(BOOL)a4 forceUpdate:(BOOL)a5 animated:(BOOL)a6;
@end

@implementation NTKSolarRichComplicationFullColorImageView

- (id)initFullColorImageViewWithDevice:(id)a3 family:(int64_t)a4
{
  v78[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v76.receiver = self;
  v76.super_class = (Class)NTKSolarRichComplicationFullColorImageView;
  v8 = [(NTKSolarRichComplicationFullColorImageView *)&v76 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    [(NTKSolarRichComplicationFullColorImageView *)v9 _setSolarPathNeedsUpdate];
    id v10 = v7;
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_58);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_58);
    if (WeakRetained)
    {
      v12 = WeakRetained;
      id v13 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_58);
      if (v13 == v10)
      {
        uint64_t v14 = [v10 version];
        uint64_t v15 = _LayoutConstants___previousCLKDeviceVersion_58;

        if (v14 == v15) {
          goto LABEL_7;
        }
      }
      else
      {
      }
    }
    id v16 = objc_storeWeak(&_LayoutConstants___cachedDevice_58, v10);
    _LayoutConstants___previousCLKDeviceVersion_58 = [v10 version];

    ___LayoutConstants_block_invoke_55(v17, v10);
LABEL_7:
    os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_58);
    if (a4 == 12)
    {
      v19 = &_LayoutConstants___constantsGraphicExtraLarge_8;
    }
    else
    {
      if (a4 != 10)
      {
        v18 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          _LayoutConstants_cold_1(a4, v18);
        }
      }
      v19 = &_LayoutConstants___constantsGraphicCircular_8;
    }
    long long v20 = v19[3];
    long long v72 = v19[2];
    long long v73 = v20;
    long long v21 = v19[5];
    long long v74 = v19[4];
    long long v75 = v21;
    long long v22 = v19[1];
    long long v70 = *v19;
    long long v71 = v22;

    long long v23 = v73;
    *(_OWORD *)&v9->_layoutConstants.lineTop = v72;
    *(_OWORD *)&v9->_layoutConstants.double strokeDiskDiameter = v23;
    long long v24 = v75;
    *(_OWORD *)&v9->_layoutConstants.fillDiskDiameter = v74;
    *(_OWORD *)&v9->_layoutConstants.haloMaxScale = v24;
    CGSize v25 = (CGSize)v71;
    *(_OWORD *)&v9->_layoutConstants.complicationContentDiameter = v70;
    v9->_layoutConstants.curveMaxSize = v25;
    v26 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v26;

    CGAffineTransformMakeRotation(&v69, 3.14159265);
    v28 = v9->_backgroundView;
    CGAffineTransform v68 = v69;
    [(UIView *)v28 setTransform:&v68];
    [(NTKSolarRichComplicationFullColorImageView *)v9 addSubview:v9->_backgroundView];
    v29 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    gradientLayer = v9->_gradientLayer;
    v9->_gradientLayer = v29;

    v31 = [(UIView *)v9->_backgroundView layer];
    [v31 addSublayer:v9->_gradientLayer];

    v32 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    gradientAdjustmentLayer = v9->_gradientAdjustmentLayer;
    v9->_gradientAdjustmentLayer = v32;

    id v34 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.541176471 blue:0.474509804 alpha:1.0];
    -[CALayer setBackgroundColor:](v9->_gradientAdjustmentLayer, "setBackgroundColor:", [v34 CGColor]);

    v35 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A300]];
    [(CALayer *)v9->_gradientAdjustmentLayer setCompositingFilter:v35];

    v36 = [(UIView *)v9->_backgroundView layer];
    [v36 addSublayer:v9->_gradientAdjustmentLayer];

    v37 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    lineView = v9->_lineView;
    v9->_lineView = v37;

    [(NTKSolarRichComplicationFullColorImageView *)v9 addSubview:v9->_lineView];
    v39 = objc_alloc_init(NTKBezierPathView);
    pathView = v9->_pathView;
    v9->_pathView = v39;

    [(NTKBezierPathView *)v9->_pathView setLineCap:*MEMORY[0x1E4F3A458]];
    [(NTKSolarRichComplicationFullColorImageView *)v9 addSubview:v9->_pathView];
    v41 = [NTKSolarTimeModel alloc];
    v42 = +[NTKDate faceDate];
    uint64_t v43 = [(NTKSolarTimeModel *)v41 initWithReferenceDate:v42 referenceLocation:0];
    solarTimeModel = v9->_solarTimeModel;
    v9->_solarTimeModel = (NTKSolarTimeModel *)v43;

    [(NTKSolarTimeModel *)v9->_solarTimeModel setUsePlaceholderData:1];
    v77[0] = &unk_1F16E42F0;
    v45 = [[NTKSolarWaypoint alloc] initWithType:1 solarTimeModel:v9->_solarTimeModel];
    v78[0] = v45;
    v77[1] = &unk_1F16E4308;
    v46 = [[NTKSolarWaypoint alloc] initWithType:2 solarTimeModel:v9->_solarTimeModel];
    v78[1] = v46;
    v77[2] = &unk_1F16E4320;
    v47 = [[NTKSolarWaypoint alloc] initWithType:3 solarTimeModel:v9->_solarTimeModel];
    v78[2] = v47;
    v77[3] = &unk_1F16E4338;
    v48 = [[NTKSolarWaypoint alloc] initWithType:4 solarTimeModel:v9->_solarTimeModel];
    v78[3] = v48;
    v77[4] = &unk_1F16E4350;
    v49 = [[NTKSolarWaypoint alloc] initWithType:5 solarTimeModel:v9->_solarTimeModel];
    v78[4] = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:5];
    waypoints = v9->_waypoints;
    v9->_waypoints = (NSDictionary *)v50;

    double strokeDiskDiameter = v9->_layoutConstants.strokeDiskDiameter;
    v53 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    strokeDiskMaskLayer = v9->_strokeDiskMaskLayer;
    v9->_strokeDiskMaskLayer = v53;

    id v55 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CALayer setBackgroundColor:](v9->_strokeDiskMaskLayer, "setBackgroundColor:", [v55 CGColor]);

    v56 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A338]];
    [(CALayer *)v9->_strokeDiskMaskLayer setCompositingFilter:v56];

    -[CALayer setFrame:](v9->_strokeDiskMaskLayer, "setFrame:", 0.0, 0.0, strokeDiskDiameter, strokeDiskDiameter);
    [(CALayer *)v9->_strokeDiskMaskLayer setCornerRadius:strokeDiskDiameter * 0.5];
    v57 = [(NTKBezierPathView *)v9->_pathView layer];
    [v57 addSublayer:v9->_strokeDiskMaskLayer];

    v58 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    strokeDiskBorderLayer = v9->_strokeDiskBorderLayer;
    v9->_strokeDiskBorderLayer = v58;

    id v60 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CALayer setBorderColor:](v9->_strokeDiskBorderLayer, "setBorderColor:", [v60 CGColor]);

    [(CALayer *)v9->_strokeDiskBorderLayer setBorderWidth:v9->_layoutConstants.strokeDiskBorderWidth];
    -[CALayer setFrame:](v9->_strokeDiskBorderLayer, "setFrame:", 0.0, 0.0, strokeDiskDiameter, strokeDiskDiameter);
    [(CALayer *)v9->_strokeDiskBorderLayer setCornerRadius:strokeDiskDiameter * 0.5];
    v61 = [(NTKBezierPathView *)v9->_pathView layer];
    [v61 addSublayer:v9->_strokeDiskBorderLayer];

    v62 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    fillDiskLayer = v9->_fillDiskLayer;
    v9->_fillDiskLayer = v62;

    id v64 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CALayer setBackgroundColor:](v9->_fillDiskLayer, "setBackgroundColor:", [v64 CGColor]);

    -[CALayer setFrame:](v9->_fillDiskLayer, "setFrame:", 0.0, 0.0, v9->_layoutConstants.fillDiskDiameter, v9->_layoutConstants.fillDiskDiameter);
    [(CALayer *)v9->_fillDiskLayer setCornerRadius:v9->_layoutConstants.fillDiskDiameter * 0.5];
    v65 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    fillDiskHaloLayer = v9->_fillDiskHaloLayer;
    v9->_fillDiskHaloLayer = v65;

    NTKImageNamed(@"RC-Solar-Disk-Halo-Color-Mask");
  }

  return 0;
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return [(NTKSolarRichComplicationFullColorImageView *)self initFullColorImageViewWithDevice:a3 family:10];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKSolarRichComplicationFullColorImageView;
  [(NTKSolarRichComplicationFullColorImageView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKSolarRichComplicationFullColorImageView;
  [(NTKSolarRichComplicationFullColorImageView *)&v16 layoutSubviews];
  [(NTKSolarRichComplicationFullColorImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_gradientAdjustmentLayer, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_lineView, "setFrame:", 0.0, self->_layoutConstants.lineTop, v8, self->_layoutConstants.lineHeight);
  double v11 = self->_layoutConstants.lineTop + self->_layoutConstants.lineHeight;
  -[CALayer setFrame:](self->_belowHorizonLayer, "setFrame:", 0.0, v11, v8, v10 - v11);
  -[UIView setFrame:](self->_fillDiskHaloContainerView, "setFrame:", v4, v6, v8, v10);
  -[NTKBezierPathView setFrame:](self->_pathView, "setFrame:", v4, v6, v8, v10);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double Width = CGRectGetWidth(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  double Height = CGRectGetHeight(v18);
  if (Width < Height) {
    double Height = Width;
  }
  double v14 = Height * 0.5;
  uint64_t v15 = [(NTKSolarRichComplicationFullColorImageView *)self layer];
  [v15 setCornerRadius:v14];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v9 = a3;
  double v5 = [v9 metadata];
  double v6 = [v5 objectForKeyedSubscript:@"NTKSolarComplicationEntryLocationKey"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    double v6 = 0;
  }
  double v7 = [v9 metadata];
  double v8 = [v7 objectForKeyedSubscript:@"NTKSolarComplicationUseIdealizedTimeKey"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    double v8 = 0;
  }
  -[NTKSolarRichComplicationFullColorImageView updateWithLocation:useIdealizedTime:forceUpdate:animated:](self, "updateWithLocation:useIdealizedTime:forceUpdate:animated:", v6, [v8 BOOLValue], 0, -[NTKSolarRichComplicationFullColorImageView _shouldAnimateWithTemplateUpdateReason:](self, "_shouldAnimateWithTemplateUpdateReason:", 1));
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  CLKInterpolateBetweenFloatsClipped();
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:");
  if (fabs(a3) >= 0.00000011920929)
  {
    double v6 = [(NTKSolarRichComplicationFullColorImageView *)self filterProvider];
    double v7 = [v6 filtersForView:self style:2];

    if (v7)
    {
      double v8 = [(UIView *)self->_fillDiskHaloContainerView layer];
      [v8 setFilters:v7];

      [(CALayer *)self->_strokeDiskBorderLayer setFilters:v7];
    }
  }
  else
  {
    double v5 = [(UIView *)self->_fillDiskHaloContainerView layer];
    [v5 setFilters:0];

    [(CALayer *)self->_strokeDiskBorderLayer setFilters:0];
  }
  id v9 = [(NTKSolarRichComplicationFullColorImageView *)self filterProvider];
  id v13 = [v9 colorForView:self accented:0];

  double v10 = [v13 colorWithAlphaComponent:0.4];
  [(UIView *)self->_lineView setBackgroundColor:v10];

  double v11 = [v13 colorWithAlphaComponent:0.78];
  [(NTKBezierPathView *)self->_pathView setPathColor:v11];

  v12 = [v13 colorWithAlphaComponent:0.1];
  [(NTKSolarRichComplicationFullColorImageView *)self setBackgroundColor:v12];
}

- (void)updateMonochromeColor
{
  [(UIView *)self->_backgroundView setAlpha:0.0];
  double v3 = [(NTKSolarRichComplicationFullColorImageView *)self filterProvider];
  id v10 = [v3 filtersForView:self style:2];

  if (v10)
  {
    double v4 = [(UIView *)self->_fillDiskHaloContainerView layer];
    [v4 setFilters:v10];

    [(CALayer *)self->_strokeDiskBorderLayer setFilters:v10];
  }
  double v5 = [(NTKSolarRichComplicationFullColorImageView *)self filterProvider];
  double v6 = [v5 colorForView:self accented:0];

  double v7 = [v6 colorWithAlphaComponent:0.4];
  [(UIView *)self->_lineView setBackgroundColor:v7];

  double v8 = [v6 colorWithAlphaComponent:0.78];
  [(NTKBezierPathView *)self->_pathView setPathColor:v8];

  id v9 = [v6 colorWithAlphaComponent:0.1];
  [(NTKSolarRichComplicationFullColorImageView *)self setBackgroundColor:v9];
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_startClockUpdates
{
  self->_paused = 0;
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    double v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__NTKSolarRichComplicationFullColorImageView__startClockUpdates__block_invoke;
    v6[3] = &unk_1E62C1288;
    objc_copyWeak(&v7, &location);
    double v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:v6 identificationLog:&__block_literal_global_148];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __64__NTKSolarRichComplicationFullColorImageView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained && !WeakRetained[696]) {
    [WeakRetained _dateDidUpdate];
  }
}

__CFString *__64__NTKSolarRichComplicationFullColorImageView__startClockUpdates__block_invoke_44()
{
  return @"solar rich complication";
}

- (void)_stopClockUpdates
{
  self->_paused = 1;
  if (self->_clockTimerToken)
  {
    double v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_dateDidUpdate
{
  BOOL v3 = [(NTKSolarRichComplicationFullColorImageView *)self _shouldAnimateWithTemplateUpdateReason:1];
  id location = self->_location;
  BOOL usingIdealizedTime = self->_usingIdealizedTime;
  [(NTKSolarRichComplicationFullColorImageView *)self updateWithLocation:location useIdealizedTime:usingIdealizedTime forceUpdate:0 animated:v3];
}

- (void)updateWithLocation:(id)a3 useIdealizedTime:(BOOL)a4 forceUpdate:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  objc_storeStrong((id *)&self->_location, a3);
  id v11 = a3;
  self->_BOOL usingIdealizedTime = v8;
  [(NTKSolarTimeModel *)self->_solarTimeModel setUsePlaceholderData:v11 == 0];
  [(NTKSolarTimeModel *)self->_solarTimeModel setReferenceLocation:v11];

  [(NTKSolarRichComplicationFullColorImageView *)self _setSolarPathNeedsUpdate];
  [(NTKSolarRichComplicationFullColorImageView *)self _updateSolarPathWithAnimated:v6];
  [(NTKSolarRichComplicationFullColorImageView *)self _updateSolarDiskWithUsingIdealizedTime:v8 forceUpdate:v7 animated:v6];
}

- (void)_setSolarPathNeedsUpdate
{
  self->_solarPathNeedsUpdate = 1;
}

- (void)_updateSolarPathWithAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  solarPath = self->_solarPath;
  BOOL solarPathNeedsUpdate = self->_solarPathNeedsUpdate;
  BOOL v7 = solarPath;
  if (solarPathNeedsUpdate)
  {
    BOOL v8 = [(NSDictionary *)self->_waypoints objectForKeyedSubscript:&unk_1F16E4308];
    id v9 = [(NSDictionary *)self->_waypoints objectForKeyedSubscript:&unk_1F16E4338];
    id v10 = +[NTKSolarRichComplicatonCircularPath pathWithDiameter:self->_solarTimeModel horizonLineTop:v8 horizonLineHeight:v9 maxCurveHeight:self->_layoutConstants.curveMaxSize.width solarTimeModel:self->_layoutConstants.lineTop sunriseWaypoint:self->_layoutConstants.lineHeight sunsetWayPoint:self->_layoutConstants.curveMaxSize.height];
    id v11 = self->_solarPath;
    self->_solarPath = v10;

    BOOL v7 = self->_solarPath;
  }
  v12 = [(NTKSolarPath *)v7 bezierPath];
  id v13 = (void *)[v12 copy];

  [v13 setLineWidth:self->_layoutConstants.curveLineWidth];
  if (self->_solarPathNeedsUpdate)
  {
    double v14 = [[NTKBezierPathPointModel alloc] initWithPath:v13];
    pointModel = self->_pointModel;
    self->_pointModel = v14;
  }
  self->_BOOL solarPathNeedsUpdate = 0;
  [(NTKSolarRichComplicationFullColorImageView *)self _updateWaypoints];
  [(NTKSolarPath *)self->_solarPath bounds];
  CGFloat v17 = (self->_layoutConstants.complicationContentDiameter - v16) * 0.5;
  CGFloat v18 = self->_layoutConstants.lineTop - self->_horizonYInCurve;
  self->_solarPathViewRect.origin.x = v17;
  self->_solarPathViewRect.origin.y = v18;
  self->_solarPathViewRect.size.width = v16;
  self->_solarPathViewRect.size.height = v19;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, v17, v18);
  CGAffineTransform v21 = v22;
  [v13 applyTransform:&v21];
  pathView = self->_pathView;
  if (v3 && solarPath) {
    [(NTKBezierPathView *)pathView animateToPath:v13 duration:1 curve:0.5];
  }
  else {
    [(NTKBezierPathView *)pathView setPath:v13];
  }
}

- (void)_updateWaypoints
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  BOOL v3 = [(NSDictionary *)self->_waypoints allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [(NTKSolarTimeModel *)self->_solarTimeModel referenceLocation];

        if (v9) {
          [v8 updateDependentValues];
        }
        else {
          [v8 updateDependentValuesWithPlaceholderData];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v5);
  }

  id v10 = [(NSDictionary *)self->_waypoints objectForKeyedSubscript:&unk_1F16E4308];
  id v11 = [(NSDictionary *)self->_waypoints objectForKeyedSubscript:&unk_1F16E4338];
  [v10 percentageThroughPeriodForWaypointDate];
  if (v12 == -1.0)
  {
    [v11 percentageThroughPeriodForWaypointDate];
    if (v19 == -1.0)
    {
      [(NTKBezierPathPointModel *)self->_pointModel pointOnPathForHorizontalPercentage:0.5];
      double v26 = v25;
      [(NTKSolarPath *)self->_solarPath altitudeAtPercentage:0.5];
      double v18 = v26 + v27;
    }
    else
    {
      solarTimeModel = self->_solarTimeModel;
      CGAffineTransform v21 = [v11 waypointDate];
      [(NTKSolarTimeModel *)solarTimeModel percentageThroughPeriodForDate:v21];
      double v23 = v22;

      [(NTKBezierPathPointModel *)self->_pointModel pointOnPathForHorizontalPercentage:v23];
      double v18 = v24 + self->_layoutConstants.lineHeight;
    }
  }
  else
  {
    id v13 = self->_solarTimeModel;
    double v14 = [v10 waypointDate];
    [(NTKSolarTimeModel *)v13 percentageThroughPeriodForDate:v14];
    double v16 = v15;

    [(NTKBezierPathPointModel *)self->_pointModel pointOnPathForHorizontalPercentage:v16];
    double v18 = v17 + self->_layoutConstants.lineHeight;
  }
  float v28 = v18;
  self->_horizonYInCurve = floorf(v28);
  [v11 percentageThroughPeriodForWaypointDate];
  if (v29 == -1.0)
  {
    [(NTKBezierPathPointModel *)self->_pointModel pointOnPathForHorizontalPercentage:0.75];
  }
  else
  {
    v30 = self->_solarTimeModel;
    v31 = [v11 waypointDate];
    [(NTKSolarTimeModel *)v30 percentageThroughPeriodForDate:v31];
    double v33 = v32;

    [(NTKBezierPathPointModel *)self->_pointModel pointOnPathForHorizontalPercentage:v33];
    *(float *)&double v34 = v34;
    double v35 = floorf(*(float *)&v34);
  }
  self->_sunsetXInCurve = v35;
}

- (void)_updateSolarDiskWithUsingIdealizedTime:(BOOL)a3 forceUpdate:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v6 = a3;
  BOOL v8 = [(NTKSolarRichComplicationFullColorImageView *)self timeTravelDate];

  solarTimeModel = self->_solarTimeModel;
  if (v8)
  {
    uint64_t v10 = [(NTKSolarRichComplicationFullColorImageView *)self timeTravelDate];
LABEL_6:
    id v13 = (void *)v10;
    [(NTKSolarTimeModel *)solarTimeModel percentageThroughPeriodForDate:v10];
    double v12 = v14;

    goto LABEL_7;
  }
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F19A20] complicationDate];
    goto LABEL_6;
  }
  [(NTKSolarTimeModel *)self->_solarTimeModel percentageThroughPeriodForIdealizedTimeInCurrentSolarDay];
  double v12 = v11;
LABEL_7:
  double v15 = (self->_layoutConstants.strokeDiskDiameter + self->_layoutConstants.strokeDiskBorderWidth) * 0.5;
  [(NTKBezierPathPointModel *)self->_pointModel pointOnPathForHorizontalPercentage:v12 withEndPadding:v15];
  double y = self->_solarPathViewRect.origin.y;
  double prevDiskTimePercentage = self->_prevDiskTimePercentage;
  if (a4 || vabdd_f64(v12, prevDiskTimePercentage) >= 0.00000011920929)
  {
    double v30 = v16;
    double height = self->_layoutConstants.curveMaxSize.height;
    double v20 = self->_layoutConstants.lineTop + self->_layoutConstants.lineHeight * 0.5 - y;
    double v21 = height * v20 / height;
    double v22 = height - v21;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__NTKSolarRichComplicationFullColorImageView__updateSolarDiskWithUsingIdealizedTime_forceUpdate_animated___block_invoke;
    aBlock[3] = &unk_1E62C8998;
    objc_copyWeak(v34, &location);
    *(double *)&v34[1] = v12 - prevDiskTimePercentage;
    v34[2] = *(id *)&prevDiskTimePercentage;
    v34[3] = *(id *)&v15;
    v34[4] = *(id *)&v20;
    v34[5] = *(id *)&v21;
    v34[6] = *(id *)&v22;
    double v23 = (void (**)(double))_Block_copy(aBlock);
    self->_double prevDiskTimePercentage = v12;
    v23[2](1.0);
    double v24 = (self->_layoutConstants.lineTop - (v30 + y))
        / (self->_layoutConstants.lineTop - self->_solarPathViewRect.origin.y);
    float v25 = 1.0;
    if (v24 < 0.1)
    {
      double v26 = (0.1 - v24) / -0.2 + 1.0;
      if (v26 > 1.0) {
        double v26 = 1.0;
      }
      if (v26 < 0.0) {
        double v26 = 0.0;
      }
      float v25 = v26;
    }
    if (v24 > 1.0) {
      double v24 = 1.0;
    }
    if (v24 < 0.0) {
      double v24 = 0.0;
    }
    CGFloat v27 = self->_layoutConstants.haloMinScale
        + (self->_layoutConstants.haloMaxScale - self->_layoutConstants.haloMinScale) * v24;
    CGAffineTransformMakeScale(&v32, v27, v27);
    fillDiskHaloLayer = self->_fillDiskHaloLayer;
    CGAffineTransform v31 = v32;
    [(CALayer *)fillDiskHaloLayer setAffineTransform:&v31];
    *(float *)&double v29 = v25;
    [(CALayer *)self->_fillDiskHaloLayer setOpacity:v29];

    objc_destroyWeak(v34);
    objc_destroyWeak(&location);
  }
}

void __106__NTKSolarRichComplicationFullColorImageView__updateSolarDiskWithUsingIdealizedTime_forceUpdate_animated___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = *(double *)(a1 + 48) + *(double *)(a1 + 40) * a2;
    double v12 = WeakRetained;
    [WeakRetained[70] pointOnPathForHorizontalPercentage:v5 - (double)(uint64_t)v5 withEndPadding:*(double *)(a1 + 56)];
    double v7 = v6;
    double v9 = v8;
    double v10 = v6 + *((double *)v12 + 80);
    double v11 = v8 + *((double *)v12 + 81);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    objc_msgSend(v12[72], "setPosition:", v10, v11);
    objc_msgSend(v12[71], "setPosition:", v10, v11);
    objc_msgSend(v12[73], "setPosition:", v10, v11);
    objc_msgSend(v12[74], "setPosition:", v10, v11);
    [v12 _updateGradientBackgroundWithYPosition:*(double *)(a1 + 64) - v9 xPercentage:v7 / *((double *)v12 + 82) topDistanceAboveHorizonLine:*(double *)(a1 + 72) bottomDistanceBelowHorizonLine:*(double *)(a1 + 80)];
    [MEMORY[0x1E4F39CF8] commit];
    id WeakRetained = v12;
  }
}

- (void)_updateGradientBackgroundWithYPosition:(double)a3 xPercentage:(double)a4 topDistanceAboveHorizonLine:(double)a5 bottomDistanceBelowHorizonLine:(double)a6
{
  v69[3] = *MEMORY[0x1E4F143B8];
  double v8 = a3 * 90.0 / a6;
  if (v8 > 90.0) {
    double v8 = 90.0;
  }
  if (v8 >= -90.0) {
    double v9 = v8;
  }
  else {
    double v9 = -90.0;
  }
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__45;
  v66 = __Block_byref_object_dispose__45;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__45;
  id v60 = __Block_byref_object_dispose__45;
  id v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  double v10 = +[NTKSolarRichComplicationCircularViewColorPoint allPoints];
  double v11 = [v10 firstObject];
  [v11 progress];
  BOOL v13 = v9 > v12;

  if (v13)
  {
    double v14 = [v10 lastObject];
    [v14 progress];
    BOOL v16 = v9 < v15;

    if (v16)
    {
      uint64_t v17 = [v10 firstObject];
      double v18 = (void *)v63[5];
      v63[5] = v17;

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __156__NTKSolarRichComplicationFullColorImageView__updateGradientBackgroundWithYPosition_xPercentage_topDistanceAboveHorizonLine_bottomDistanceBelowHorizonLine___block_invoke;
      v51[3] = &unk_1E62C89C0;
      *(double *)&v51[7] = v9;
      v51[4] = &v56;
      v51[5] = &v62;
      v51[6] = &v52;
      [v10 enumerateObjectsUsingBlock:v51];
      goto LABEL_12;
    }
    uint64_t v22 = [v10 lastObject];
    double v23 = (void *)v63[5];
    v63[5] = v22;

    uint64_t v21 = [v10 lastObject];
  }
  else
  {
    uint64_t v19 = [v10 firstObject];
    double v20 = (void *)v63[5];
    v63[5] = v19;

    uint64_t v21 = [v10 firstObject];
  }
  double v24 = (void *)v57[5];
  v57[5] = v21;

  v53[3] = 0x3FF0000000000000;
LABEL_12:
  float v25 = [(id)v63[5] color1];
  double v26 = [(id)v57[5] color1];
  CGFloat v27 = NTKInterpolateBetweenColors();

  float v28 = [(id)v63[5] color2];
  double v29 = [(id)v57[5] color2];
  double v30 = NTKInterpolateBetweenColors();

  CGAffineTransform v31 = [(id)v63[5] color3];
  CGAffineTransform v32 = [(id)v57[5] color3];
  double v33 = NTKInterpolateBetweenColors();

  [(id)v63[5] position1];
  [(id)v57[5] position1];
  CLKInterpolateBetweenFloatsClipped();
  double v35 = v34;
  [(id)v63[5] position2];
  [(id)v57[5] position2];
  CLKInterpolateBetweenFloatsClipped();
  double v37 = v36;
  [(id)v63[5] position3];
  [(id)v57[5] position3];
  CLKInterpolateBetweenFloatsClipped();
  double v39 = v38;
  id v40 = v27;
  v69[0] = [v40 CGColor];
  id v41 = v30;
  v69[1] = [v41 CGColor];
  id v42 = v33;
  v69[2] = [v42 CGColor];
  uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  [(CAGradientLayer *)self->_gradientLayer setColors:v43];

  v44 = [NSNumber numberWithDouble:v35];
  v68[0] = v44;
  v45 = [NSNumber numberWithDouble:v37];
  v68[1] = v45;
  v46 = [NSNumber numberWithDouble:v39];
  v68[2] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  [(CAGradientLayer *)self->_gradientLayer setLocations:v47];

  double v48 = self->_sunsetXInCurve / self->_solarPathViewRect.size.width;
  double backgroundGradientSunsetLayerMaxAlpha = self->_layoutConstants.backgroundGradientSunsetLayerMaxAlpha;
  if (v48 <= a4)
  {
    *(float *)&double v48 = backgroundGradientSunsetLayerMaxAlpha;
  }
  else
  {
    double v50 = v48 - a4;
    double v48 = 0.0;
    if (v50 <= 0.15)
    {
      double v48 = backgroundGradientSunsetLayerMaxAlpha + v50 / -0.15 * backgroundGradientSunsetLayerMaxAlpha;
      *(float *)&double v48 = v48;
    }
  }
  [(CALayer *)self->_gradientAdjustmentLayer setOpacity:v48];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
}

void __156__NTKSolarRichComplicationFullColorImageView__updateGradientBackgroundWithYPosition_xPercentage_topDistanceAboveHorizonLine_bottomDistanceBelowHorizonLine___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (a3)
  {
    double v9 = *(double *)(a1 + 56);
    id v18 = v8;
    [v8 progress];
    if (v9 <= v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) progress];
      double v12 = v11;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) progress];
      if (v12 >= v13) {
        double v14 = v13;
      }
      else {
        double v14 = v12;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) progress];
      double v16 = v15;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) progress];
      if (v16 >= v17) {
        double v17 = v16;
      }
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(double *)(a1 + 56) - v14) / (v17 - v14);
      *a4 = 1;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
    id v8 = v18;
  }
}

- (void)_didReceiveTimeZoneDidChangeNotification
{
  [(NTKSolarTimeModel *)self->_solarTimeModel updateForTimeZoneChange];
  [(NTKSolarRichComplicationFullColorImageView *)self _setSolarPathNeedsUpdate];
  BOOL v3 = [(NTKSolarRichComplicationFullColorImageView *)self _shouldAnimateWithTemplateUpdateReason:1];
  id location = self->_location;
  BOOL usingIdealizedTime = self->_usingIdealizedTime;
  [(NTKSolarRichComplicationFullColorImageView *)self updateWithLocation:location useIdealizedTime:usingIdealizedTime forceUpdate:0 animated:v3];
}

- (void)_didReceiveSignificantTimeChangeNotification
{
  BOOL v3 = [(NTKSolarRichComplicationFullColorImageView *)self _shouldAnimateWithTemplateUpdateReason:1];
  id location = self->_location;
  BOOL usingIdealizedTime = self->_usingIdealizedTime;
  [(NTKSolarRichComplicationFullColorImageView *)self updateWithLocation:location useIdealizedTime:usingIdealizedTime forceUpdate:0 animated:v3];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (BOOL)usingIdealizedTime
{
  return self->_usingIdealizedTime;
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_fillDiskHaloContainerView, 0);
  objc_storeStrong((id *)&self->_belowHorizonLayer, 0);
  objc_storeStrong((id *)&self->_fillDiskHaloLayer, 0);
  objc_storeStrong((id *)&self->_fillDiskLayer, 0);
  objc_storeStrong((id *)&self->_strokeDiskBorderLayer, 0);
  objc_storeStrong((id *)&self->_strokeDiskMaskLayer, 0);
  objc_storeStrong((id *)&self->_pointModel, 0);
  objc_storeStrong((id *)&self->_solarPath, 0);
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_pathView, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_gradientAdjustmentLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end