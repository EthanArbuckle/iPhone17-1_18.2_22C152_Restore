@interface HangHUDLine
- (CATextLayer)processNameLayer;
- (HUDDurationLayer)durationLayer;
- (HUDTheme)currentTheme;
- (HangHUDLine)initWithQueue:(id)a3 processName:(id)a4 theme:(id)a5 fontSize:(double)a6 lineDelegate:(id)a7;
- (int64_t)statusForHangWithDuration:(double)a3 timedOut:(BOOL)a4;
- (void)nilifyCALayers;
- (void)setCurrentTheme:(id)a3;
- (void)setFontSize:(double)a3;
- (void)update:(id)a3 options:(unint64_t)a4;
@end

@implementation HangHUDLine

- (HangHUDLine)initWithQueue:(id)a3 processName:(id)a4 theme:(id)a5 fontSize:(double)a6 lineDelegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HangHUDLine;
  v16 = [(HUDLine *)&v22 init];
  if (v16)
  {
    [(HUDLine *)v16 setSpacing:sub_10002B340()];
    uint64_t v17 = +[CATextLayer layer];
    processNameLayer = v16->_processNameLayer;
    v16->_processNameLayer = (CATextLayer *)v17;

    [(CATextLayer *)v16->_processNameLayer setTruncationMode:kCATruncationEnd];
    if (qword_100063CB0 != -1) {
      dispatch_once(&qword_100063CB0, &stru_100051508);
    }
    [(CATextLayer *)v16->_processNameLayer setFont:qword_100063CB8];
    [(CATextLayer *)v16->_processNameLayer setFontSize:a6];
    [(HUDLine *)v16 contentScaleForTexts];
    -[CATextLayer setContentsScale:](v16->_processNameLayer, "setContentsScale:");
    [(CATextLayer *)v16->_processNameLayer setString:v13];
    [(HUDLine *)v16 setVibrancyFilter:v16->_processNameLayer];
    uint64_t v19 = +[HUDDurationLayer layer];
    durationLayer = v16->_durationLayer;
    v16->_durationLayer = (HUDDurationLayer *)v19;

    if (qword_100063CC0 != -1) {
      dispatch_once(&qword_100063CC0, &stru_100051528);
    }
    [(HUDDurationLayer *)v16->_durationLayer setFont:qword_100063CC8];
    [(HUDDurationLayer *)v16->_durationLayer setFontSize:a6];
    [(HUDLine *)v16 contentScaleForTexts];
    -[HUDDurationLayer setContentsScale:](v16->_durationLayer, "setContentsScale:");
    [(HUDDurationLayer *)v16->_durationLayer setAlignmentMode:kCAAlignmentRight];
    [(HUDDurationLayer *)v16->_durationLayer setQueue:v12];
    [(HUDLine *)v16 setVibrancyFilter:v16->_durationLayer];
    [(HangHUDLine *)v16 addSublayer:v16->_processNameLayer];
    [(HangHUDLine *)v16 addSublayer:v16->_durationLayer];
    objc_storeStrong((id *)&v16->_currentTheme, a5);
    [(HUDLine *)v16 setLineDelegate:v15];
    [(HUDLine *)v16 setKeyLayer:v16->_processNameLayer];
    [(HUDLine *)v16 setValueLayer:v16->_durationLayer];
  }

  return v16;
}

- (void)nilifyCALayers
{
  processNameLayer = self->_processNameLayer;
  self->_processNameLayer = 0;

  durationLayer = self->_durationLayer;
  self->_durationLayer = 0;
}

- (void)setFontSize:(double)a3
{
  -[CATextLayer setFontSize:](self->_processNameLayer, "setFontSize:");
  durationLayer = self->_durationLayer;

  [(HUDDurationLayer *)durationLayer setFontSize:a3];
}

- (int64_t)statusForHangWithDuration:(double)a3 timedOut:(BOOL)a4
{
  if (a4) {
    return 3;
  }
  uint64_t v14 = v8;
  uint64_t v15 = v4;
  if (sub_10002B9CC()) {
    +[HUDConfiguration sharedInstance];
  }
  else {
  id v12 = +[HTPrefs sharedPrefs];
  }
  id v13 = [v12 runloopHangTimeoutDurationMSec:v9, v14, v5, v15, v6, v7];

  if ((double)(unint64_t)v13 * 0.555555556 <= a3) {
    return 2;
  }
  else {
    return (double)(unint64_t)v13 * 0.222222222 <= a3;
  }
}

- (void)update:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (![(HUDLine *)self updatesComplete])
  {
    uint64_t v7 = v6;
    uint64_t v8 = [(CATextLayer *)self->_processNameLayer animationForKey:@"foreground-color-fade-animation"];
    if (v8)
    {
      uint64_t v9 = sub_100027DEC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to update a HUD line with an animation in progress!", v18, 2u);
      }
    }
    else
    {
      durationLayer = self->_durationLayer;
      [v7 hangDurationMS];
      double v12 = v11;
      [(HUDDurationLayer *)self->_durationLayer hangDuration];
      [(HUDDurationLayer *)durationLayer setHangDuration:v13 > 0.0 animated:v12];
      [v7 hangDurationMS];
      int64_t v14 = -[HangHUDLine statusForHangWithDuration:timedOut:](self, "statusForHangWithDuration:timedOut:", (a4 >> 1) & 1);
      uint64_t v15 = [(HUDTheme *)self->_currentTheme currentHangTextColorForStatus:v14];
      [(CATextLayer *)self->_processNameLayer setForegroundColor:v15];
      [(HUDDurationLayer *)self->_durationLayer setForegroundColor:v15];
      if (a4)
      {
LABEL_12:

        goto LABEL_13;
      }
      v16 = sub_100027DEC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100031F6C(v7);
      }

      [(HUDLine *)self setUpdatesComplete:1];
      uint64_t v9 = +[CABasicAnimation animationWithKeyPath:@"foregroundColor"];
      [v9 setRemovedOnCompletion:0];
      [v9 setFillMode:kCAFillModeForwards];
      [v9 setToValue:[(HUDTheme *)self->_currentTheme previousHangTextColorForStatus:v14]];
      [v9 setDuration:0.5];
      uint64_t v17 = objc_alloc_init(HUDLineAnimationDelegate);
      [(HUDLineAnimationDelegate *)v17 setHudLine:self];
      [v9 setDelegate:v17];
      [(CATextLayer *)self->_processNameLayer addAnimation:v9 forKey:@"foreground-color-fade-animation"];
      [(HUDDurationLayer *)self->_durationLayer addAnimation:v9 forKey:@"foreground-color-fade-animation"];
    }
    goto LABEL_12;
  }
  uint64_t v7 = sub_100027DEC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100031EF4((uint64_t)self, v7);
  }
LABEL_13:
}

- (HUDTheme)currentTheme
{
  return self->_currentTheme;
}

- (void)setCurrentTheme:(id)a3
{
}

- (CATextLayer)processNameLayer
{
  return self->_processNameLayer;
}

- (HUDDurationLayer)durationLayer
{
  return self->_durationLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationLayer, 0);
  objc_storeStrong((id *)&self->_processNameLayer, 0);

  objc_storeStrong((id *)&self->_currentTheme, 0);
}

@end