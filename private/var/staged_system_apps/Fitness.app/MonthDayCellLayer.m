@interface MonthDayCellLayer
- (BOOL)cellMinimized;
- (BOOL)hasWorkout;
- (BOOL)isFutureDay;
- (CGRect)fullFrame;
- (CGRect)narrowFrame;
- (MonthDayCellLayer)initWithDateCache:(id)a3;
- (void)pressToTransition:(BOOL)a3;
- (void)setCellMinimized:(BOOL)a3;
- (void)setFullFrame:(CGRect)a3;
- (void)setHasWorkout:(BOOL)a3;
- (void)setIsFutureDay:(BOOL)a3;
- (void)setNarrowFrame:(CGRect)a3;
- (void)setPercentMinimized:(double)a3;
- (void)setupCircleBackground;
- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4;
@end

@implementation MonthDayCellLayer

- (MonthDayCellLayer)initWithDateCache:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MonthDayCellLayer;
  v3 = [(MonthDayCellLayer *)&v20 initWithDateCache:a3];
  if (v3)
  {
    v4 = +[UIFont systemFontOfSize:16.0];
    [(MonthDayCellLayer *)v3 setFont:v4];

    v5 = [(MonthDayCellLayer *)v3 font];
    [(MonthDayCellLayer *)v3 setBoldFont:v5];

    [(MonthDayCellLayer *)v3 setDayDiameter:25.0];
    v6 = +[UIScreen mainScreen];
    v7 = [v6 traitCollection];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10017AB54;
    v18[3] = &unk_1008ABA78;
    v8 = v3;
    v19 = v8;
    [v7 performAsCurrentTraitCollection:v18];

    v9 = objc_alloc_init(MonthWorkoutIndicator);
    id v10 = v8[1];
    v8[1] = v9;

    v11 = +[UIScreen mainScreen];
    [v11 scale];
    [v8[1] setContentsScale:];

    [v8[1] setHasWorkout:0];
    v12 = [v8 circle];
    [v12 frame];
    CGFloat v13 = CGRectGetMaxX(v21) + 4.0;
    v14 = [v8 circle];
    [v14 frame];
    [v8[1] setFrame:v13, CGRectGetMaxY(v22) + 1.0, 6.0, 6.0];

    id v15 = v8[1];
    v16 = [v8 circle];
    [v8 insertSublayer:v15 below:v16];
  }
  return v3;
}

- (void)updateWithDate:(id)a3 dayOfMonth:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MonthDayCellLayer;
  id v6 = a3;
  [(MonthDayCellLayer *)&v12 updateWithDate:v6 dayOfMonth:a4];
  self->_dayOfMonth = a4;
  -[MonthDayCellLayer setHasWorkout:](self, "setHasWorkout:", self->_hasWorkout, v12.receiver, v12.super_class);
  [(MonthDayCellLayer *)self setupCircleBackground];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  v9 = [(MonthDayCellLayer *)self dateCache];
  id v10 = [v9 startOfDayMidnight];
  [v10 timeIntervalSinceReferenceDate];
  self->_isFutureDay = v8 > v11;
}

- (void)setHasWorkout:(BOOL)a3
{
  self->_hasWorkout = a3;
  [(MonthWorkoutIndicator *)self->_workoutIndicator setHasWorkout:"setHasWorkout:"];
  v4 = +[UIScreen mainScreen];
  v5 = [v4 traitCollection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017ADA4;
  v8[3] = &unk_1008ABA78;
  v8[4] = self;
  [v5 performAsCurrentTraitCollection:v8];

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  int64_t dayOfMonth = self->_dayOfMonth;
  double v7 = [(MonthDayCellLayer *)self textColor];
  [(MonthDayCellLayer *)self updateDateTextForDayNumber:dayOfMonth textColor:v7];

  +[CATransaction commit];
}

- (void)setupCircleBackground
{
  uint64_t v3 = [(MonthDayCellLayer *)self representsToday] ^ 1;
  v4 = [(MonthDayCellLayer *)self circle];
  [v4 setHidden:v3];

  if ([(MonthDayCellLayer *)self representsToday])
  {
    v5 = +[ARUIMetricColors energyColors];
    id v6 = [v5 nonGradientTextColor];
  }
  else
  {
    id v6 = +[UIColor darkGrayColor];
  }
  double v7 = [(MonthDayCellLayer *)self circle];
  id v8 = v6;
  [v7 setBackgroundColor:[v8 CGColor]];
}

- (void)pressToTransition:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:0.3];
  if (([(MonthDayCellLayer *)self representsToday] & 1) == 0)
  {
    v5 = [(MonthDayCellLayer *)self circle];
    [v5 setHidden:!v3];
  }

  +[CATransaction commit];
}

- (void)setPercentMinimized:(double)a3
{
  double y = self->_fullFrame.origin.y;
  double width = self->_fullFrame.size.width;
  double height = self->_fullFrame.size.height;
  CGFloat v7 = self->_fullFrame.origin.x + (self->_narrowFrame.origin.x - self->_fullFrame.origin.x) * a3;
  -[MonthDayCellLayer setFrame:](self, "setFrame:", v7, y, width, height);
  v12.origin.x = v7;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  double v8 = CGRectGetWidth(v12) + 4.0;
  v13.origin.x = v7;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  double v9 = CGRectGetHeight(v13);
  workoutIndicator = self->_workoutIndicator;

  -[MonthWorkoutIndicator setFrame:](workoutIndicator, "setFrame:", v8, v9 + 1.0, 6.0, 6.0);
}

- (BOOL)cellMinimized
{
  return self->_cellMinimized;
}

- (void)setCellMinimized:(BOOL)a3
{
  self->_cellMinimized = a3;
}

- (BOOL)isFutureDay
{
  return self->_isFutureDay;
}

- (void)setIsFutureDay:(BOOL)a3
{
  self->_isFutureDadouble y = a3;
}

- (BOOL)hasWorkout
{
  return self->_hasWorkout;
}

- (CGRect)fullFrame
{
  double x = self->_fullFrame.origin.x;
  double y = self->_fullFrame.origin.y;
  double width = self->_fullFrame.size.width;
  double height = self->_fullFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullFrame:(CGRect)a3
{
  self->_fullFrame = a3;
}

- (CGRect)narrowFrame
{
  double x = self->_narrowFrame.origin.x;
  double y = self->_narrowFrame.origin.y;
  double width = self->_narrowFrame.size.width;
  double height = self->_narrowFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNarrowFrame:(CGRect)a3
{
  self->_narrowFrame = a3;
}

- (void).cxx_destruct
{
}

@end