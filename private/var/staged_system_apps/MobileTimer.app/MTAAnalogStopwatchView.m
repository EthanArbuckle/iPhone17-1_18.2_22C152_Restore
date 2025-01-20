@interface MTAAnalogStopwatchView
- (CGPoint)_minutesCircleCenter:(double *)a3;
- (MTAAnalogStopwatchHandView)lapSecondsHand;
- (MTAAnalogStopwatchHandView)minutesHand;
- (MTAAnalogStopwatchHandView)secondsHand;
- (MTAAnalogStopwatchView)initWithFrame:(CGRect)a3;
- (MTUITimeView)timeView;
- (NSNumberFormatter)numberFormatter;
- (double)currentLapTime;
- (double)displayAdjustedElapsedTime;
- (double)elapsedTime;
- (void)drawRect:(CGRect)a3;
- (void)handleLocaleChange;
- (void)layoutSubviews;
- (void)setCurrentLapTime:(double)a3;
- (void)setDisplayAdjustedElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setLapSecondsHand:(id)a3;
- (void)setMinutesHand:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setSecondsHand:(id)a3;
- (void)setTimeView:(id)a3;
@end

@implementation MTAAnalogStopwatchView

- (MTAAnalogStopwatchView)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)MTAAnalogStopwatchView;
  v3 = -[MTAAnalogStopwatchView initWithFrame:](&v37, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTAAnalogStopwatchView *)v3 setUserInteractionEnabled:0];
    id v5 = objc_alloc((Class)MTUITimeView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(MTAAnalogStopwatchView *)v4 setTimeView:v9];

    v10 = +[UIColor mtui_primaryTextColor];
    v11 = [(MTAAnalogStopwatchView *)v4 timeView];
    [v11 setTextColor:v10];

    v12 = [(MTAAnalogStopwatchView *)v4 timeView];
    [v12 setTextAlignment:1];

    v13 = [(MTAAnalogStopwatchView *)v4 timeView];
    [v13 setAdjustsFontSizeToFitWidth:1];

    v14 = [(MTAAnalogStopwatchView *)v4 timeView];
    [v14 setTime:0.0];

    v15 = [(MTAAnalogStopwatchView *)v4 timeView];
    [(MTAAnalogStopwatchView *)v4 addSubview:v15];

    v16 = -[MTAAnalogStopwatchHandView initWithFrame:]([MTAAnalogStopwatchHandView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(MTAAnalogStopwatchView *)v4 setMinutesHand:v16];

    v17 = +[UIColor mtui_tintColor];
    v18 = [(MTAAnalogStopwatchView *)v4 minutesHand];
    [v18 setColor:v17];

    v19 = [(MTAAnalogStopwatchView *)v4 minutesHand];
    [v19 setAnchorStyle:1];

    v20 = [(MTAAnalogStopwatchView *)v4 minutesHand];
    [(MTAAnalogStopwatchView *)v4 addSubview:v20];

    v21 = -[MTAAnalogStopwatchHandView initWithFrame:]([MTAAnalogStopwatchHandView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(MTAAnalogStopwatchView *)v4 setLapSecondsHand:v21];

    v22 = +[UIColor systemBlueColor];
    v23 = [(MTAAnalogStopwatchView *)v4 lapSecondsHand];
    [v23 setColor:v22];

    v24 = [(MTAAnalogStopwatchView *)v4 lapSecondsHand];
    [v24 setHasTail:1];

    v25 = [(MTAAnalogStopwatchView *)v4 lapSecondsHand];
    [(MTAAnalogStopwatchView *)v4 addSubview:v25];

    v26 = -[MTAAnalogStopwatchHandView initWithFrame:]([MTAAnalogStopwatchHandView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(MTAAnalogStopwatchView *)v4 setSecondsHand:v26];

    v27 = +[UIColor mtui_tintColor];
    v28 = [(MTAAnalogStopwatchView *)v4 secondsHand];
    [v28 setColor:v27];

    v29 = [(MTAAnalogStopwatchView *)v4 secondsHand];
    [v29 setHasTail:1];

    v30 = [(MTAAnalogStopwatchView *)v4 secondsHand];
    [v30 setAnchorStyle:2];

    v31 = [(MTAAnalogStopwatchView *)v4 secondsHand];
    [(MTAAnalogStopwatchView *)v4 addSubview:v31];

    v32 = objc_opt_new();
    [(MTAAnalogStopwatchView *)v4 setNumberFormatter:v32];

    v33 = [(MTAAnalogStopwatchView *)v4 numberFormatter];
    [v33 setNumberStyle:1];

    v34 = +[NSLocale autoupdatingCurrentLocale];
    v35 = [(MTAAnalogStopwatchView *)v4 numberFormatter];
    [v35 setLocale:v34];
  }
  return v4;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
  [(MTAAnalogStopwatchView *)self elapsedTime];
  long double v5 = fmod(v4 / 60.0, 30.0) * 0.20943951;
  v6 = [(MTAAnalogStopwatchView *)self minutesHand];
  [v6 setAngle:(double)v5];

  [(MTAAnalogStopwatchView *)self elapsedTime];
  long double v8 = fmod(v7, 60.0) * 0.104719755;
  id v9 = [(MTAAnalogStopwatchView *)self secondsHand];
  [v9 setAngle:(double)v8];
}

- (void)setDisplayAdjustedElapsedTime:(double)a3
{
  self->_displayAdjustedElapsedTime = a3;
  id v4 = [(MTAAnalogStopwatchView *)self timeView];
  [v4 setTime:a3];
}

- (void)setCurrentLapTime:(double)a3
{
  self->_currentLapTime = a3;
  [(MTAAnalogStopwatchView *)self currentLapTime];
  long double v5 = fmod(v4, 60.0) * 0.104719755;
  id v6 = [(MTAAnalogStopwatchView *)self lapSecondsHand];
  [v6 setAngle:(double)v5];
}

- (void)handleLocaleChange
{
  v3 = [(MTAAnalogStopwatchView *)self timeView];
  [v3 handleLocaleChange];

  [(MTAAnalogStopwatchView *)self setNeedsDisplay];
}

- (void)layoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)MTAAnalogStopwatchView;
  [(MTAAnalogStopwatchView *)&v56 layoutSubviews];
  [(MTAAnalogStopwatchView *)self bounds];
  double v55 = 0.0;
  CGFloat v3 = CGRectGetHeight(v57) / 311.0;
  [(MTAAnalogStopwatchView *)self _minutesCircleCenter:&v55];
  double v5 = v4;
  double v7 = v6;
  UIRoundToViewScale();
  double v9 = v8;
  double v10 = v5 - v55;
  double v11 = v7 - v55;
  double v12 = v55 + v55;
  v13 = [(MTAAnalogStopwatchView *)self minutesHand];
  [v13 setFrame:v10, v11, v12, v12];

  [(MTAAnalogStopwatchView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(MTAAnalogStopwatchView *)self secondsHand];
  [v22 setFrame:v15, v17, v19, v21];

  [(MTAAnalogStopwatchView *)self bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(MTAAnalogStopwatchView *)self lapSecondsHand];
  [v31 setFrame:v24, v26, v28, v30];

  v32 = [(MTAAnalogStopwatchView *)self minutesHand];
  [v32 setWidth:v9];

  v33 = [(MTAAnalogStopwatchView *)self secondsHand];
  [v33 setWidth:v9];

  v34 = [(MTAAnalogStopwatchView *)self lapSecondsHand];
  [v34 setWidth:v9];

  v35 = +[UIFont systemFontOfSize:v3 * 20.0 weight:UIFontWeightRegular];
  v36 = [v35 mtui_fontByAddingTimeFontAttributes];

  objc_super v37 = [(MTAAnalogStopwatchView *)self timeView];
  [v37 setTime:359999.0];

  v38 = [(MTAAnalogStopwatchView *)self timeView];
  [v38 setFont:v36];

  v39 = [(MTAAnalogStopwatchView *)self timeView];
  [v39 sizeToFit];

  [(MTAAnalogStopwatchView *)self elapsedTime];
  double v41 = v40;
  v42 = [(MTAAnalogStopwatchView *)self timeView];
  [v42 setTime:v41];

  v43 = [(MTAAnalogStopwatchView *)self timeView];
  [v43 frame];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;

  [(MTAAnalogStopwatchView *)self bounds];
  CGFloat v50 = CGRectGetMidX(v58) + v47 * -0.5;
  v51 = [(MTAAnalogStopwatchView *)self timeView];
  [v51 setFrame:v50, v45, v47, v49];

  [(MTAAnalogStopwatchView *)self bounds];
  CGRectGetHeight(v59);
  UIRoundToViewScale();
  double v53 = v52;
  v54 = [(MTAAnalogStopwatchView *)self timeView];
  [v54 _setFirstLineBaselineFrameOriginY:v53];

  [(MTAAnalogStopwatchView *)self setNeedsDisplay];
}

- (CGPoint)_minutesCircleCenter:(double *)a3
{
  [(MTAAnalogStopwatchView *)self bounds];
  CGRectGetWidth(v12);
  UIRoundToViewScale();
  uint64_t v6 = v5;
  [(MTAAnalogStopwatchView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v13);
  [(MTAAnalogStopwatchView *)self bounds];
  CGRectGetMidY(v14);
  UIRoundToViewScale();
  double v9 = v8;
  if (a3) {
    *(void *)a3 = v6;
  }
  double v10 = MidX;
  result.double y = v9;
  result.x = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(MTAAnalogStopwatchView *)self bounds];
  CGFloat MidX = CGRectGetMidX(v78);
  [(MTAAnalogStopwatchView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v79);
  [(MTAAnalogStopwatchView *)self bounds];
  double v8 = v7;
  [(MTAAnalogStopwatchView *)self bounds];
  double v9 = CGRectGetHeight(v80) / 311.0;
  CGContextSaveGState(CurrentContext);
  c = CurrentContext;
  CGContextTranslateCTM(CurrentContext, MidX, MidY);
  double v10 = v8 * -0.5;
  CGAffineTransformMakeRotation(&v73, 0.0261799388);
  CGFloat v11 = v73.ty + v10 * v73.d + v73.b * 0.0 - v10;
  double v12 = sqrt((v73.tx + v10 * v73.c + v73.a * 0.0) * (v73.tx + v10 * v73.c + v73.a * 0.0) + v11 * v11) * 0.5;
  v76[0] = NSFontAttributeName;
  CGRect v13 = +[UIFont systemFontOfSize:v9 * 26.0];
  v77[0] = v13;
  v76[1] = NSForegroundColorAttributeName;
  CGRect v14 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV15foregroundColorAF010ForegroundhB0Ovg_ptr;
  double v15 = +[UIColor whiteColor];
  v77[1] = v15;
  double v16 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];

  unint64_t v17 = 1;
  double v18 = 7.0;
  double v19 = 13.0;
  do
  {
    double v20 = objc_opt_new();
    [v20 moveToPoint:0.0, v10];
    if ((v17 & 3) != 0) {
      double v21 = v18;
    }
    else {
      double v21 = v19;
    }
    double v22 = v10 + v9 * v21;
    [v20 addLineToPoint:0.0, v22];
    CGAffineTransformMakeRotation(&v72, (double)v17 * 0.0261799388);
    [v20 applyTransform:&v72];
    [v20 setLineWidth:v12];
    HIDWORD(v23) = -858993459 * v17;
    LODWORD(v23) = HIDWORD(v23);
    if ((v23 >> 2) < 0xCCCCCCD)
    {
      double v24 = +[UIColor mtui_stopwatchMajorTickMarkColor];
      [v24 setStroke];
      [v20 stroke];
      double v25 = [(MTAAnalogStopwatchView *)self numberFormatter];
      double v26 = +[NSNumber numberWithUnsignedInteger:v17 >> 2];
      double v27 = [v25 stringFromNumber:v26];

      CGRect v14 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV15foregroundColorAF010ForegroundhB0Ovg_ptr;
      [v27 sizeWithAttributes:v16];
      double v29 = v28;
      double v30 = v22 + 5.0;
      double v32 = v31 * 0.5;
      double v33 = v30 + v31 * 0.5;
      CGAffineTransformMakeRotation(&v71, (double)v17 * 0.0261799388);
      CGFloat v34 = v71.tx + v33 * v71.c + v71.a * 0.0;
      double v35 = v33 * v71.d;
      double v19 = 13.0;
      double v36 = v29 * 0.5;
      double v18 = 7.0;
      [v27 drawAtPoint:v16 withAttributes:v34 - v36, v71.ty + v35 + v71.b * 0.0 - v32];
    }
    else
    {
      double v24 = +[UIColor mtui_stopwatchMinorTickMarkColor];
      [v24 setStroke];
      [v20 stroke];
    }

    ++v17;
  }
  while (v17 != 241);

  CGContextRestoreGState(c);
  double v70 = 0.0;
  [(MTAAnalogStopwatchView *)self _minutesCircleCenter:&v70];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGContextSaveGState(c);
  CGContextTranslateCTM(c, v38, v40);
  UICeilToViewScale();
  double v42 = v41;
  v74[0] = NSFontAttributeName;
  v43 = +[UIFont systemFontOfSize:v9 * 14.0];
  v74[1] = NSForegroundColorAttributeName;
  v75[0] = v43;
  double v44 = +[UIColor whiteColor];
  v75[1] = v44;
  double v45 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];

  unint64_t v46 = 1;
  double v47 = 5.0;
  double v48 = 8.0;
  do
  {
    double v49 = objc_opt_new();
    [v49 moveToPoint:0.0, -v70];
    if (v46) {
      double v50 = v47;
    }
    else {
      double v50 = v48;
    }
    double v51 = v9 * v50;
    [v49 addLineToPoint:0.0, v9 * v50 - v70];
    CGAffineTransformMakeRotation(&v69, (double)v46 * 0.104719755);
    [v49 applyTransform:&v69];
    [v49 setLineWidth:v42];
    double v52 = v14[467];
    HIDWORD(v53) = -858993459 * v46;
    LODWORD(v53) = HIDWORD(v53);
    if ((v53 >> 1) < 0x1999999A)
    {
      v54 = [v52 mtui_stopwatchMajorTickMarkColor];
      [v54 setStroke];
      [v49 stroke];
      double v55 = [(MTAAnalogStopwatchView *)self numberFormatter];
      objc_super v56 = +[NSNumber numberWithUnsignedInteger:v46 >> 1];
      CGRect v57 = [v55 stringFromNumber:v56];

      CGRect v14 = &_s10Foundation15AttributeScopesO7SwiftUIE0D12UIAttributesV15foregroundColorAF010ForegroundhB0Ovg_ptr;
      [v57 sizeWithAttributes:v45];
      double v59 = v58;
      double v60 = v51 - v70 + 3.0;
      double v62 = v61 * 0.5;
      double v63 = v61 * 0.5 + v60;
      CGAffineTransformMakeRotation(&v68, (double)v46 * 0.104719755);
      CGFloat v64 = v68.tx + v63 * v68.c + v68.a * 0.0;
      double v65 = v63 * v68.d;
      double v48 = 8.0;
      double v66 = v59 * 0.5;
      double v47 = 5.0;
      [v57 drawAtPoint:v45 withAttributes:v64 - v66, v68.ty + v65 + v68.b * 0.0 - v62];
    }
    else
    {
      v54 = [v52 mtui_stopwatchMinorTickMarkColor];
      [v54 setStroke];
      [v49 stroke];
    }

    ++v46;
  }
  while (v46 != 61);

  CGContextRestoreGState(c);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (double)displayAdjustedElapsedTime
{
  return self->_displayAdjustedElapsedTime;
}

- (double)currentLapTime
{
  return self->_currentLapTime;
}

- (MTAAnalogStopwatchHandView)minutesHand
{
  return self->_minutesHand;
}

- (void)setMinutesHand:(id)a3
{
}

- (MTAAnalogStopwatchHandView)secondsHand
{
  return self->_secondsHand;
}

- (void)setSecondsHand:(id)a3
{
}

- (MTAAnalogStopwatchHandView)lapSecondsHand
{
  return self->_lapSecondsHand;
}

- (void)setLapSecondsHand:(id)a3
{
}

- (MTUITimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_lapSecondsHand, 0);
  objc_storeStrong((id *)&self->_secondsHand, 0);

  objc_storeStrong((id *)&self->_minutesHand, 0);
}

@end