@interface NTKSchoolTimeFaceView
+ (id)schoolTimeColor;
+ (id)secondHandColor;
- (NTKSchoolTimeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_handleChangeNotification;
- (void)_layoutCurvedNameLabel;
- (void)_setDate:(id)a3;
- (void)_setupNameLabel;
- (void)_setupNotifications;
- (void)_startClockUpdates;
- (void)_startObserving;
- (void)_stopClockUpdates;
- (void)_stopObserving;
- (void)_tearDownUI;
- (void)_timeDidUpdate:(id)a3;
- (void)_unloadSnapshotContentViews;
- (void)_updateTimeAndDate:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setName:(id)a3;
- (void)setupUI;
@end

@implementation NTKSchoolTimeFaceView

- (NTKSchoolTimeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKSchoolTimeFaceView;
  v5 = [(NTKFaceView *)&v8 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5) {
    [(NTKSchoolTimeFaceView *)v5 setupUI];
  }
  return v6;
}

- (void)_unloadSnapshotContentViews
{
  v2.receiver = self;
  v2.super_class = (Class)NTKSchoolTimeFaceView;
  [(NTKFaceView *)&v2 _unloadSnapshotContentViews];
}

- (void)dealloc
{
  [(NTKSchoolTimeFaceView *)self _stopClockUpdates];
  [(NTKSchoolTimeFaceView *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)NTKSchoolTimeFaceView;
  [(NTKFaceView *)&v3 dealloc];
}

- (void)_setupNotifications
{
  [(NTKSchoolTimeFaceView *)self _startObserving];
  [(NTKSchoolTimeFaceView *)self _startClockUpdates];
}

- (void)setupUI
{
  double v67 = 0.0;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  memset(v62, 0, sizeof(v62));
  objc_super v3 = [(NTKFaceView *)self device];
  _LayoutConstants_4(v3, (uint64_t)v62);

  v4 = [MEMORY[0x1E4FB1618] blackColor];
  [(NTKSchoolTimeFaceView *)self setBackgroundColor:v4];

  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v7 = [(NTKFaceView *)self device];
  +[NTKAnalogUtilities dialSizeForDevice:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [NTKSchoolTimeDialView alloc];
  v13 = -[NTKSchoolTimeDialView initWithFrame:ringWidth:](v12, "initWithFrame:ringWidth:", v5, v6, v9, v11, v67);
  dialView = self->_dialView;
  self->_dialView = v13;

  v15 = [(NTKFaceView *)self contentView];
  [v15 addSubview:self->_dialView];

  v16 = [NTKAnalogHandsView alloc];
  v17 = [(NTKFaceView *)self device];
  v18 = [(NTKAnalogHandsView *)v16 initForDevice:v17];
  handsView = self->_handsView;
  self->_handsView = v18;

  v20 = self->_handsView;
  [(NTKSchoolTimeFaceView *)self bounds];
  -[NTKAnalogHandsView setFrame:](v20, "setFrame:");
  v21 = self->_handsView;
  v22 = +[NTKSchoolTimeFaceView schoolTimeColor];
  [(CLKUIAnalogHandsView *)v21 setInlayColor:v22];

  v23 = [(CLKUIAnalogHandsView *)self->_handsView secondHandView];
  v24 = +[NTKSchoolTimeFaceView secondHandColor];
  [v23 setColor:v24];

  v25 = [(NTKFaceView *)self contentView];
  [v25 addSubview:self->_handsView];

  [(NTKFaceView *)self setTimeView:self->_handsView];
  v26 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  formatter = self->_formatter;
  self->_formatter = v26;

  v28 = self->_formatter;
  v29 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [(NSDateFormatter *)v28 setTimeZone:v29];

  v30 = self->_formatter;
  v31 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(NSDateFormatter *)v30 setLocale:v31];

  [(NSDateFormatter *)self->_formatter setDateFormat:@"EEE d"];
  id v32 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v33 = *MEMORY[0x1E4F1DB28];
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v37 = (UILabel *)objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E4F1DB28], v34, v35, v36);
  dateLabel = self->_dateLabel;
  self->_dateLabel = v37;

  v39 = self->_dateLabel;
  double v40 = *MEMORY[0x1E4FB09D0];
  v41 = [MEMORY[0x1E4F19A50] systemFontOfSize:*((double *)v62 + 1) weight:*MEMORY[0x1E4FB09D0]];
  [(UILabel *)v39 setFont:v41];

  [(UILabel *)self->_dateLabel setTextAlignment:1];
  v42 = self->_dateLabel;
  v43 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v42 setTextColor:v43];

  v44 = [(NTKFaceView *)self contentView];
  [v44 addSubview:self->_dateLabel];

  v45 = (CLKClockTimer *)[objc_alloc(MEMORY[0x1E4F196B0]) initWithIdentifier:@"SchoolTime"];
  clockTimer = self->_clockTimer;
  self->_clockTimer = v45;

  [(CLKClockTimer *)self->_clockTimer pause];
  id v61 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(double *)&v63 weight:v40];
  v47 = [(NTKFaceView *)self device];
  v48 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, v61, v47, v33, v34, v35, v36, 0.0, 0.0);

  v49 = [MEMORY[0x1E4F19A50] systemFontOfSize:*((double *)&v63 + 1) weight:v40];
  [v48 setDesignatorFont:v49];

  v50 = [NTKDigitalTimeLabel alloc];
  v51 = [(NTKFaceView *)self device];
  v52 = [(CLKUITimeLabel *)v50 initWithTimeLabelOptions:1 forDevice:v51 clockTimer:self->_clockTimer];
  digitalTimeLabel = self->_digitalTimeLabel;
  self->_digitalTimeLabel = v52;

  [(NTKDigitalTimeLabel *)self->_digitalTimeLabel setStyle:v48];
  v54 = self->_digitalTimeLabel;
  v55 = [MEMORY[0x1E4FB1618] whiteColor];
  [(NTKDigitalTimeLabel *)v54 setColor:v55];

  [(CLKUITimeLabel *)self->_digitalTimeLabel setShowsDesignator:1];
  v56 = self->_digitalTimeLabel;
  v57 = +[NTKTimeOffsetManager sharedManager];
  [v57 timeOffset];
  -[NTKDigitalTimeLabel setTimeOffset:](v56, "setTimeOffset:");

  v58 = [(CLKUITimeLabel *)self->_digitalTimeLabel timeFormatter];
  [v58 setSuppressesDesignatorWhitespace:1];

  v59 = [(NTKFaceView *)self contentView];
  [v59 insertSubview:self->_digitalTimeLabel belowSubview:self->_handsView];

  [(NTKSchoolTimeFaceView *)self _setupNameLabel];
  v60 = +[NTKDate faceDate];
  [(NTKSchoolTimeFaceView *)self _updateTimeAndDate:v60 animated:0];

  [(NTKSchoolTimeFaceView *)self bringSubviewToFront:self->_handsView];
}

- (void)_setupNameLabel
{
  id v15 = [(NTKFaceView *)self device];
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  memset(v16, 0, sizeof(v16));
  _LayoutConstants_4(v15, (uint64_t)v16);
  objc_super v3 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(double *)&v17 weight:*MEMORY[0x1E4FB09D0]];
  if ([v15 deviceCategory] == 1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    p_nameLabel = &self->_nameLabel;
    nameLabel = self->_nameLabel;
    self->_nameLabel = v5;

    [(UILabel *)self->_nameLabel setTextAlignment:1];
    double v8 = self->_nameLabel;
    double v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)self->_nameLabel setFont:v3];
  }
  else
  {
    double v10 = (CLKUICurvedColoringLabel *)objc_opt_new();
    p_nameLabel = &self->_curvedNameLabel;
    curvedNameLabel = self->_curvedNameLabel;
    self->_curvedNameLabel = v10;

    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setAlpha:1.0];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setCenterAngle:0.0];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setCircleRadius:*(double *)&v18 * 0.5];
    v12 = self->_curvedNameLabel;
    v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUICurvedColoringLabel *)v12 setColor:v13];

    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setFont:v3];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setInterior:1];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setMaxAngularWidth:NTKWhistlerBezelCircularViewDefaultMaxAngularWidth()];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setTracking:*((double *)&v18 + 1)];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setUppercase:1];
    [(CLKUICurvedColoringLabel *)self->_curvedNameLabel setUsesLegibility:0];
  }
  v14 = [(NTKFaceView *)self contentView];
  [v14 addSubview:*p_nameLabel];
}

- (void)_layoutCurvedNameLabel
{
  objc_super v3 = [(NTKFaceView *)self device];
  _LayoutConstants_4(v3, (uint64_t)v11);
  double v4 = v12;

  [(CLKUICurvedColoringLabel *)self->_curvedNameLabel sizeToFit];
  double v9 = 0.0;
  double v10 = 0.0;
  [(CLKUICurvedColoringLabel *)self->_curvedNameLabel getTextCenter:&v9 startAngle:0 endAngle:0];
  double v5 = MEMORY[0x1C1874A70]([(NTKSchoolTimeFaceView *)self bounds]);
  double v6 = v5 - v9 + 0.0;
  double v8 = v4 + v7 - v10;
  [(CLKUICurvedColoringLabel *)self->_curvedNameLabel frame];
  -[CLKUICurvedColoringLabel setFrame:](self->_curvedNameLabel, "setFrame:", v6, v8);
}

- (void)_tearDownUI
{
  [(NTKSchoolTimeDialView *)self->_dialView removeFromSuperview];
  [(NTKAnalogHandsView *)self->_handsView removeFromSuperview];
  [(UILabel *)self->_dateLabel removeFromSuperview];
  [(NTKDigitalTimeLabel *)self->_digitalTimeLabel removeFromSuperview];
  [(CLKUICurvedColoringLabel *)self->_curvedNameLabel removeFromSuperview];
  nameLabel = self->_nameLabel;
  [(UILabel *)nameLabel removeFromSuperview];
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)NTKSchoolTimeFaceView;
  [(NTKFaceView *)&v35 layoutSubviews];
  double v34 = 0.0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v3 = [(NTKFaceView *)self device];
  _LayoutConstants_4(v3, (uint64_t)&v28);

  double v4 = MEMORY[0x1C1874A70]([(NTKSchoolTimeFaceView *)self bounds]);
  double v6 = v5;
  double v7 = v34;
  double v8 = *((double *)&v31 + 1);
  -[NTKSchoolTimeDialView setCenter:](self->_dialView, "setCenter:");
  [(NTKSchoolTimeDialView *)self->_dialView frame];
  double MinY = CGRectGetMinY(v36);
  [(NTKSchoolTimeDialView *)self->_dialView bounds];
  double v11 = v10 + v7 * -0.5 * 2.0 - v8 * 2.0;
  double v12 = MEMORY[0x1C1874A70]([(NTKSchoolTimeFaceView *)self bounds]) + v11 * -0.5;
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    v14 = [(UILabel *)dateLabel font];
    double v15 = NTKSingleLineHeight((uint64_t)v14, 0);

    -[UILabel setFrame:](self->_dateLabel, "setFrame:", v12, *(double *)&v29 + MinY + *(double *)&v28 - v15, v11, v15);
  }
  digitalTimeLabel = self->_digitalTimeLabel;
  if (digitalTimeLabel)
  {
    long long v17 = [(CLKUITimeLabel *)digitalTimeLabel font];
    double v18 = NTKSingleLineHeight((uint64_t)v17, 0);

    -[NTKDigitalTimeLabel setFrame:](self->_digitalTimeLabel, "setFrame:", v12, *(double *)&v31 + MinY + *((double *)&v29 + 1) - v18, v11, v18);
  }
  uint64_t v19 = [(NTKFaceView *)self device];
  uint64_t v20 = [v19 deviceCategory];

  if (v20 == 1)
  {
    [(NTKSchoolTimeDialView *)self->_dialView frame];
    double MaxY = CGRectGetMaxY(v37);
    double v22 = MaxY + *((double *)&v32 + 1);
    [(NTKSchoolTimeFaceView *)self bounds];
    double v24 = v23;
    [(NTKSchoolTimeFaceView *)self bounds];
    -[UILabel setFrame:](self->_nameLabel, "setFrame:", 0.0, v22, v24, v25 - MaxY);
  }
  else
  {
    [(NTKSchoolTimeFaceView *)self _layoutCurvedNameLabel];
  }
  -[NTKAnalogHandsView setCenter:](self->_handsView, "setCenter:", v4, v6);
  handsView = self->_handsView;
  [(NTKSchoolTimeFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](handsView, "ntk_setBoundsAndPositionFromFrame:");
  v27 = [(NTKFaceView *)self contentView];
  [v27 bringSubviewToFront:self->_handsView];
}

- (void)_applyDataMode
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSchoolTimeFaceView;
  [(NTKFaceView *)&v5 _applyDataMode];
  int64_t v3 = [(NTKFaceView *)self dataMode];
  switch(v3)
  {
    case 1:
      [(NTKFaceView *)self setOverrideDate:0 duration:0.0];
      [(NTKSchoolTimeFaceView *)self _startClockUpdates];
      return;
    case 3:
      double v4 = NTKIdealizedDate();
      [(NTKFaceView *)self setOverrideDate:v4 duration:0.0];

      goto LABEL_7;
    case 2:
LABEL_7:
      [(NTKSchoolTimeFaceView *)self _stopClockUpdates];
      break;
  }
}

- (void)_applyFrozen
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSchoolTimeFaceView;
  [(NTKFaceView *)&v4 _applyFrozen];
  BOOL v3 = [(NTKFaceView *)self isFrozen];
  [(CLKUIAnalogHandsView *)self->_handsView setFrozen:v3];
  [(NTKDigitalTimeLabel *)self->_digitalTimeLabel setFrozen:v3];
}

- (void)setName:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F19A30];
  id v5 = a3;
  double v6 = [v4 currentDevice];
  uint64_t v7 = [v6 deviceCategory];

  if (v7 == 1)
  {
    nameLabel = self->_nameLabel;
    id v13 = [v5 uppercaseString];

    [(UILabel *)nameLabel setText:v13];
  }
  else
  {
    curvedNameLabel = self->_curvedNameLabel;
    double v10 = (void *)MEMORY[0x1E4F19AB0];
    double v11 = [v5 uppercaseString];

    double v12 = [v10 textProviderWithText:v11];
    [(CLKUICurvedColoringLabel *)curvedNameLabel setTextProvider:v12];

    [(NTKSchoolTimeFaceView *)self _layoutCurvedNameLabel];
  }
}

- (void)_setDate:(id)a3
{
  dateLabel = self->_dateLabel;
  id v5 = [(NSDateFormatter *)self->_formatter stringFromDate:a3];
  objc_super v4 = [v5 localizedUppercaseString];
  [(UILabel *)dateLabel setText:v4];
}

- (void)_startClockUpdates
{
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    clockTimer = self->_clockTimer;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    double v8 = __43__NTKSchoolTimeFaceView__startClockUpdates__block_invoke;
    double v9 = &unk_1E62C1288;
    objc_copyWeak(&v10, &location);
    objc_super v4 = [(CLKClockTimer *)clockTimer startUpdatesWithUpdateFrequency:0 withHandler:&v6 identificationLog:&__block_literal_global_28];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  [(CLKClockTimer *)self->_clockTimer unpause];
}

void __43__NTKSchoolTimeFaceView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = +[NTKTimeOffsetManager sharedManager];
    uint64_t v7 = [v6 displayTimeForRealTime:*a3];
    [WeakRetained _timeDidUpdate:v7];

    double v8 = (void *)WeakRetained[109];
    double v9 = +[NTKTimeOffsetManager sharedManager];
    [v9 timeOffset];
    objc_msgSend(v8, "setTimeOffset:");
  }
}

__CFString *__43__NTKSchoolTimeFaceView__startClockUpdates__block_invoke_32()
{
  return @"NTKSchoolTimeViewController";
}

- (void)_stopClockUpdates
{
  [(CLKClockTimer *)self->_clockTimer pause];
  if (self->_clockTimerToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_clockTimer, "stopUpdatesForToken:");
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_timeDidUpdate:(id)a3
{
}

- (void)_updateTimeAndDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  dialView = self->_dialView;
  id v7 = a3;
  [(NTKSchoolTimeDialView *)dialView setActiveHour:NTKDateHourIn12HourTime(v7) animated:v4];
  [(NTKSchoolTimeFaceView *)self _setDate:v7];
}

- (void)_startObserving
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleChangeNotification name:*MEMORY[0x1E4F1C370] object:0];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handleChangeNotification name:*MEMORY[0x1E4FB2708] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__handleChangeNotification name:@"NTKTimeOffsetChangedNotification" object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__handleChangeNotification name:*MEMORY[0x1E4F1C2E0] object:0];
}

- (void)_stopObserving
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"NTKTimeOffsetChangedNotification" object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
}

- (void)_handleChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NTKSchoolTimeFaceView__handleChangeNotification__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __50__NTKSchoolTimeFaceView__handleChangeNotification__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[NTKDate faceDate];
  [v1 _updateTimeAndDate:v2 animated:1];
}

+ (id)schoolTimeColor
{
  if (schoolTimeColor_onceToken != -1) {
    dispatch_once(&schoolTimeColor_onceToken, &__block_literal_global_42);
  }
  id v2 = (void *)schoolTimeColor___color;
  return v2;
}

void __40__NTKSchoolTimeFaceView_schoolTimeColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.905882353 green:0.733333333 blue:0.125490196 alpha:1.0];
  v1 = (void *)schoolTimeColor___color;
  schoolTimeColor___color = v0;
}

+ (id)secondHandColor
{
  if (secondHandColor_onceToken != -1) {
    dispatch_once(&secondHandColor_onceToken, &__block_literal_global_44);
  }
  id v2 = (void *)secondHandColor___color;
  return v2;
}

void __40__NTKSchoolTimeFaceView_secondHandColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.894117647 blue:0.592156863 alpha:1.0];
  v1 = (void *)secondHandColor___color;
  secondHandColor___color = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_clockTimer, 0);
  objc_storeStrong((id *)&self->_curvedNameLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabel, 0);
  objc_storeStrong((id *)&self->_handsView, 0);
  objc_storeStrong((id *)&self->_dialView, 0);
}

@end