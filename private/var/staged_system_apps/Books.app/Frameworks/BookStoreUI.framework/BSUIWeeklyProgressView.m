@interface BSUIWeeklyProgressView
+ (id)renderModelWithIdentifier:(id)a3 metrics:(id)a4;
- (BOOL)_isVisible;
- (BOOL)_updateEnvironment;
- (BOOL)clipsToBounds;
- (BOOL)runningStreakFromPreviousWeek;
- (BOOL)shouldShowTrailingSpacerLine;
- (BSUIDynamicValue)lastVisibleProgressToday;
- (BSUIWeeklyProgressMetrics)metrics;
- (BSUIWeeklyProgressView)initWithFrame:(CGRect)a3;
- (CALayer)backgroundLayer;
- (NSArray)days;
- (NSArray)layoutInfosToDisplay;
- (NSString)dateOfLastDay;
- (NSString)description;
- (TUIDynamicProgress)dynamicProgress;
- (_BSUIWeeklyProgressLayoutInfo)todayLayoutInfo;
- (_BSUIWeeklyProgressLayoutInfo)todaySeparatorLayoutInfo;
- (_BSUIWeeklyProgressRenderModel)renderModel;
- (double)progressToday;
- (double)visibleProgressToday;
- (int64_t)lastAXValue;
- (void)_animateProgressTodayIfNeeded;
- (void)_calculateComponents;
- (void)_calculateLayout;
- (void)_configureWithModel:(id)a3;
- (void)_setupBackground;
- (void)_setupViews;
- (void)_setupWeeklyProgressWithUpdateMode:(unint64_t)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)dynamicProgressChanged:(id)a3;
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
- (void)setBackgroundLayer:(id)a3;
- (void)setDateOfLastDay:(id)a3;
- (void)setDays:(id)a3;
- (void)setDynamicProgress:(id)a3;
- (void)setLastAXValue:(int64_t)a3;
- (void)setLastVisibleProgressToday:(id)a3;
- (void)setLayoutInfosToDisplay:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setProgressToday:(double)a3;
- (void)setRenderModel:(id)a3;
- (void)setRunningStreakFromPreviousWeek:(BOOL)a3;
- (void)setTodayLayoutInfo:(id)a3;
- (void)setTodaySeparatorLayoutInfo:(id)a3;
- (void)setVisibleProgressToday:(double)a3;
- (void)viewDidEndDisplay;
- (void)viewWillDisplay;
@end

@implementation BSUIWeeklyProgressView

- (BSUIWeeklyProgressView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BSUIWeeklyProgressView;
  v3 = -[BSUIWeeklyProgressView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[BSUITemplate manager];
    v5 = [v4 dynamicRegistry];

    v6 = +[BCReadingTimeToday kind];
    v7 = [v5 progressProviderForKind:v6];
    v8 = [v7 dynamicProgressForKind:v6 instance:0 parameters:0];
    [v8 registerProgressObserver:v3];
    objc_storeStrong((id *)&v3->_dynamicProgress, v8);
    v9 = +[UITraitCollection bc_allAPITraits];
    id v10 = [(BSUIWeeklyProgressView *)v3 registerForTraitChanges:v9 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)dealloc
{
  [(TUIDynamicProgress *)self->_dynamicProgress unregisterProgressObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BSUIWeeklyProgressView;
  [(BSUIWeeklyProgressView *)&v3 dealloc];
}

+ (id)renderModelWithIdentifier:(id)a3 metrics:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_BSUIWeeklyProgressRenderModel);
  [(_BSUIWeeklyProgressRenderModel *)v7 setMetrics:v5];

  id v8 = [objc_alloc((Class)TUIRenderModelView) initWithReuseIdentifier:@"BSUIReuseIdentifierWeeklyProgressView" identifier:v6 submodel:v7];

  return v8;
}

- (void)viewWillDisplay
{
  v9.receiver = self;
  v9.super_class = (Class)BSUIWeeklyProgressView;
  [(BSUIWeeklyProgressView *)&v9 viewWillDisplay];
  objc_super v3 = [(BSUIWeeklyProgressView *)self layer];
  [v3 setMasksToBounds:0];

  v4 = [(BSUIWeeklyProgressView *)self backgroundLayer];
  [v4 setMasksToBounds:0];

  id v5 = [(_BSUIWeeklyProgressRenderModel *)self->_renderModel metrics];
  id v6 = [v5 triggerName];

  if ([v6 length])
  {
    v7 = [(BSUIWeeklyProgressView *)self feedControllerHost];
    id v8 = [v7 triggerStateManager];
    [v8 addObserver:self forTrigger:v6];
  }
}

- (void)viewDidEndDisplay
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIWeeklyProgressView;
  [(BSUIWeeklyProgressView *)&v7 viewDidEndDisplay];
  objc_super v3 = [(_BSUIWeeklyProgressRenderModel *)self->_renderModel metrics];
  v4 = [v3 triggerName];

  if ([v4 length])
  {
    id v5 = [(BSUIWeeklyProgressView *)self feedControllerHost];
    id v6 = [v5 triggerStateManager];
    [v6 removeObserver:self forTrigger:v4];
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a4 userInterfaceStyle:a3];
  id v6 = [(BSUIWeeklyProgressView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(BSUIWeeklyProgressView *)self _setupWeeklyProgressWithUpdateMode:0];
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BSUIWeeklyProgressView;
  id v4 = a3;
  [(BSUIWeeklyProgressView *)&v7 applyLayoutAttributes:v4];
  id v5 = [v4 renderModel];

  id v6 = [v5 submodel];
  [(BSUIWeeklyProgressView *)self _configureWithModel:v6];
}

- (void)_configureWithModel:(id)a3
{
  id v4 = (_BSUIWeeklyProgressRenderModel *)a3;
  id v5 = v4;
  if (!self->_renderModel) {
    goto LABEL_5;
  }
  double progressToday = self->_progressToday;
  objc_super v7 = [(_BSUIWeeklyProgressRenderModel *)v4 metrics];
  [v7 progressToday];
  if (progressToday == v8)
  {

LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  double v9 = fabs(v8 * 0.000000999999997);
  double v10 = vabdd_f64(progressToday, v8);

  if (v10 < v9) {
    goto LABEL_5;
  }
  uint64_t v11 = 1;
LABEL_6:
  renderModel = self->_renderModel;
  self->_renderModel = v5;
  v13 = v5;

  v14 = [(_BSUIWeeklyProgressRenderModel *)v13 metrics];
  metrics = self->_metrics;
  self->_metrics = v14;

  v16 = [(BSUIWeeklyProgressMetrics *)self->_metrics days];
  days = self->_days;
  self->_days = v16;

  self->_runningStreakFromPreviousWeek = [(BSUIWeeklyProgressMetrics *)self->_metrics isRunningStreak];
  [(BSUIWeeklyProgressMetrics *)self->_metrics progressToday];
  self->_double progressToday = v18;
  v19 = [(BSUIWeeklyProgressMetrics *)self->_metrics lastVisibleProgressToday];
  lastVisibleProgressToday = self->_lastVisibleProgressToday;
  self->_lastVisibleProgressToday = v19;

  if ([(BSUIWeeklyProgressView *)self _updateEnvironment]) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v11;
  }
  [(BSUIWeeklyProgressView *)self _setupWeeklyProgressWithUpdateMode:v21];
  v22 = [(_BSUIWeeklyProgressRenderModel *)self->_renderModel metrics];

  id v26 = [v22 triggerName];

  if ([v26 length])
  {
    v23 = [(BSUIWeeklyProgressView *)self superview];

    if (v23)
    {
      v24 = [(BSUIWeeklyProgressView *)self feedControllerHost];
      v25 = [v24 triggerStateManager];
      [v25 addObserver:self forTrigger:v26];
    }
  }
}

- (BOOL)shouldShowTrailingSpacerLine
{
  return 0;
}

- (void)_calculateComponents
{
  objc_super v3 = [(BSUIWeeklyProgressView *)self days];
  uint64_t v4 = (uint64_t)[v3 count];

  if (v4 < 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSMutableArray arrayWithCapacity:(2 * v4) | 1];
    unsigned int v6 = [(BSUIWeeklyProgressView *)self runningStreakFromPreviousWeek];
    objc_super v7 = objc_opt_new();
    double v8 = v7;
    if (v6) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 3;
    }
    if (v6) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
    [v7 setLayoutType:v9];
    uint64_t v11 = [BSUIProgressSeparatorController alloc];
    [v8 frame];
    objc_super v12 = -[BSUIProgressSeparatorController initWithProgressView:frame:](v11, "initWithProgressView:frame:", self);
    [v8 setSeparator:v12];

    [v5 addObject:v8];
    id v13 = (id)objc_opt_new();
    [v13 setPercentComplete:v10];
    [v13 setLayoutType:0];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [(BSUIWeeklyProgressView *)self days];
    id v53 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v53)
    {
      uint64_t v54 = 0;
      v14 = 0;
      uint64_t v52 = *(void *)v56;
      while (1)
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          v16 = v13;
          v17 = v8;
          double v18 = v14;
          if (*(void *)v56 != v52) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v20 = objc_opt_new();
          uint64_t v21 = [v19 text];
          [v20 setDayLabel:v21];

          [v20 setLayoutType:[v19 type]];
          if ([v20 layoutType] == (char *)&dword_0 + 1) {
            [(BSUIWeeklyProgressView *)self visibleProgressToday];
          }
          else {
            [v19 progress];
          }
          [v20 setPercentComplete:];
          v22 = [BSUIProgressSingleDayController alloc];
          [v20 frame];
          double v24 = v23;
          double v26 = v25;
          double v28 = v27;
          double v30 = v29;
          [v20 percentComplete];
          double v32 = v31;
          v33 = [v20 dayLabel];
          v14 = -[BSUIProgressSingleDayController initWithProgressView:frame:progress:label:](v22, "initWithProgressView:frame:progress:label:", self, v33, v24, v26, v28, v30, v32);

          [v20 setDay:v14];
          [v5 addObject:v20];
          [v16 percentComplete];
          if (v34 < 1.0)
          {
LABEL_17:
            uint64_t v35 = 3;
LABEL_24:
            [v17 setLayoutType:v35];
            goto LABEL_25;
          }
          [v20 percentComplete];
          if (v36 >= 1.0)
          {
            if ([v17 layoutType] == (char *)&dword_4 + 2) {
              uint64_t v35 = 7;
            }
            else {
              uint64_t v35 = 5;
            }
            goto LABEL_24;
          }
          if ([v20 layoutType] != (char *)&dword_0 + 1) {
            goto LABEL_17;
          }
LABEL_25:
          if ([v20 layoutType] == (char *)&dword_0 + 1)
          {
            [(BSUIWeeklyProgressView *)self setTodayLayoutInfo:v20];
            [(BSUIWeeklyProgressView *)self setTodaySeparatorLayoutInfo:v17];
          }
          uint64_t v37 = (uint64_t)i + v54 + 1;
          id v13 = v20;

          v38 = [(BSUIWeeklyProgressView *)self days];
          id v39 = [v38 count];

          unsigned int v40 = [(BSUIWeeklyProgressView *)self shouldShowTrailingSpacerLine];
          double v8 = objc_opt_new();
          BOOL v41 = v37 == (void)v39;
          if ((id)v37 == v39 && v40)
          {
            [v13 percentComplete];
            BOOL v41 = v42 < 1.0;
          }
          if (v41) {
            uint64_t v43 = 3;
          }
          else {
            uint64_t v43 = 4;
          }
          [v8 setLayoutType:v43];
          v44 = [BSUIProgressSeparatorController alloc];
          [v8 frame];
          v45 = -[BSUIProgressSeparatorController initWithProgressView:frame:](v44, "initWithProgressView:frame:", self);
          [v8 setSeparator:v45];

          [v5 addObject:v8];
        }
        id v53 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        v54 += (uint64_t)i;
        if (!v53)
        {

          break;
        }
      }
    }
  }
  v46 = [(BSUIWeeklyProgressView *)self metrics];
  v47 = [v46 rightToLeft];
  unsigned int v48 = [v47 BOOLValue];

  if (v48)
  {
    v49 = [v5 reverseObjectEnumerator];
    v50 = [v49 allObjects];
    [(BSUIWeeklyProgressView *)self setLayoutInfosToDisplay:v50];
  }
  else
  {
    [(BSUIWeeklyProgressView *)self setLayoutInfosToDisplay:v5];
  }
}

- (void)_calculateLayout
{
  objc_super v3 = [(BSUIWeeklyProgressView *)self days];
  id v4 = [v3 count];

  [(BSUIWeeklyProgressView *)self bounds];
  double Width = CGRectGetWidth(v37);
  [(BSUIWeeklyProgressView *)self bounds];
  double Height = CGRectGetHeight(v38);
  [(BSUIWeeklyProgressView *)self bounds];
  double MidY = CGRectGetMidY(v39);
  objc_super v7 = [(BSUIWeeklyProgressView *)self metrics];
  double v8 = [v7 spacerWidth];
  [v8 floatValue];
  double v10 = v9;

  uint64_t v11 = [(BSUIWeeklyProgressView *)self metrics];
  objc_super v12 = [v11 spacerHeight];
  [v12 floatValue];
  float v14 = v13;

  double v15 = floor((Width - (double)((uint64_t)v4 + 1) * v10) / (double)(uint64_t)v4);
  if (v15 <= Height) {
    double v16 = -0.0;
  }
  else {
    double v16 = v15 - Height;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  if (v15 <= Height) {
    double v17 = v15;
  }
  else {
    double v17 = Height;
  }
  long long v32 = 0uLL;
  long long v33 = 0uLL;
  double v18 = [(BSUIWeeklyProgressView *)self layoutInfosToDisplay];
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    double v21 = v14;
    double v22 = v16 + v10;
    uint64_t v23 = *(void *)v33;
    double v24 = 0.0;
    do
    {
      double v25 = 0;
      double v26 = v24;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v18);
        }
        double v27 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v25);
        double v28 = [v27 day];

        if (v28) {
          double v29 = v17;
        }
        else {
          double v29 = v22;
        }
        if (v28) {
          double v30 = v17;
        }
        else {
          double v30 = v21;
        }
        v40.origin.x = v26;
        v40.origin.y = MidY + v30 * -0.5;
        v40.size.width = v29;
        v40.size.height = v30;
        double v24 = v26 + CGRectGetWidth(v40);
        [v27 setFrame:v26 MidY + v30 * -0.5, v29, v30];
        double v25 = (char *)v25 + 1;
        double v26 = v24;
      }
      while (v20 != v25);
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)_setupViews
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(BSUIWeeklyProgressView *)self layoutInfosToDisplay];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        double v8 = [v7 day];
        if (v8) {
          [v8 configureWithType:[v7 layoutType]];
        }
        float v9 = [v7 separator];
        if (v9) {
          [v9 configureWithType:[v7 layoutType]];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)_setupBackground
{
  id v3 = [(BSUIWeeklyProgressView *)self backgroundLayer];

  if (!v3)
  {
    id v4 = +[CALayer layer];
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v4;
  }
  [(BSUIWeeklyProgressView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:");
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:", v7, v9, v11, v13);
  id v14 = [(BSUIWeeklyProgressView *)self backgroundColor];
  -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", [v14 CGColor]);

  if (self->_debugBounds)
  {
    id v15 = +[UIColor blueColor];
    -[CALayer setBorderColor:](self->_backgroundLayer, "setBorderColor:", [v15 CGColor]);

    [(CALayer *)self->_backgroundLayer setBorderWidth:0.5];
  }
  [(CALayer *)self->_backgroundLayer setMasksToBounds:1];
  id v16 = [(BSUIWeeklyProgressView *)self layer];
  [v16 addSublayer:self->_backgroundLayer];
}

- (BOOL)_updateEnvironment
{
  id v3 = [(BSUIWeeklyProgressView *)self metrics];
  id v4 = [v3 axValue];
  id v5 = [v4 integerValue];

  int64_t v6 = [(BSUIWeeklyProgressView *)self lastAXValue];
  char v7 = v6 != (void)v5;
  if ((id)v6 != v5) {
    [(BSUIWeeklyProgressView *)self setLastAXValue:v5];
  }
  double v8 = [(BSUIWeeklyProgressView *)self metrics];
  double v9 = [v8 currentDayShortString];

  uint64_t v10 = [(BSUIWeeklyProgressView *)self dateOfLastDay];
  if (!v10
    || (double v11 = (void *)v10,
        [(BSUIWeeklyProgressView *)self dateOfLastDay],
        double v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v9 isEqualToString:v12],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    id v14 = [(BSUIWeeklyProgressView *)self dateOfLastDay];

    if (v14 && v9)
    {
      id v15 = [(BSUIWeeklyProgressView *)self metrics];
      [v15 progressToday];
      double v17 = v16;

      [(BSUIWeeklyProgressView *)self setVisibleProgressToday:v17];
    }
    [(BSUIWeeklyProgressView *)self setDateOfLastDay:v9];
    char v7 = 1;
  }

  return v7;
}

- (void)_setupWeeklyProgressWithUpdateMode:(unint64_t)a3
{
  if (a3 == 1)
  {
    if ([(BSUIWeeklyProgressView *)self _isVisible])
    {
      [(BSUIWeeklyProgressView *)self _animateProgressTodayIfNeeded];
    }
  }
  else if (!a3)
  {
    [(CALayer *)self->_backgroundLayer removeFromSuperlayer];
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = 0;

    layoutInfosToDisplay = self->_layoutInfosToDisplay;
    self->_layoutInfosToDisplay = 0;

    [(BSUIWeeklyProgressView *)self _setupBackground];
    [(BSUIWeeklyProgressView *)self _calculateComponents];
    [(BSUIWeeklyProgressView *)self _calculateLayout];
    [(BSUIWeeklyProgressView *)self _setupViews];
  }
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (BOOL)_isVisible
{
  return self->_lastTriggerState == 2;
}

- (double)visibleProgressToday
{
  objc_opt_class();
  id v3 = [(BSUIDynamicValue *)self->_lastVisibleProgressToday value];
  uint64_t v4 = BUDynamicCast();
  id v5 = (void *)v4;
  int64_t v6 = &off_3A0B00;
  if (v4) {
    int64_t v6 = (_UNKNOWN **)v4;
  }
  char v7 = v6;

  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (void)setVisibleProgressToday:(double)a3
{
  lastVisibleProgressToday = self->_lastVisibleProgressToday;
  id v4 = +[NSNumber numberWithDouble:a3];
  [(BSUIDynamicValue *)lastVisibleProgressToday updateWithValueIfChanged:v4];
}

- (void)_animateProgressTodayIfNeeded
{
  [(BSUIWeeklyProgressView *)self visibleProgressToday];
  double v4 = v3;
  [(BSUIWeeklyProgressView *)self progressToday];
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_todayLayoutInfo);
  id v12 = [WeakRetained day];

  [v12 progress];
  if (v4 == v6)
  {
    if (v6 == v8 || v12 == 0) {
      goto LABEL_4;
    }
  }
  else if (!v12)
  {
    goto LABEL_4;
  }
  float v9 = [(BSUIWeeklyProgressView *)self todaySeparatorLayoutInfo];
  uint64_t v10 = [v9 separator];
  [v10 updateProgress:1 animate:v6];

  [(BSUIWeeklyProgressView *)self setVisibleProgressToday:v6];
  [v12 updateProgress:1 animate:v6];
LABEL_4:
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7 = a3;
  self->_lastTriggerState = a4;
  double v8 = [(BSUIWeeklyProgressView *)self metrics];
  id v9 = [v8 targetTriggerState];
  if (a4 && v9 == (id)a4)
  {
    uint64_t v10 = [(BSUIWeeklyProgressView *)self metrics];
    double v11 = [v10 triggerName];
    unsigned int v12 = [v11 isEqualToString:v7];

    if (v12)
    {
      unsigned __int8 v13 = [(BSUIWeeklyProgressView *)self metrics];
      id v14 = [v13 triggerDelay];
      [v14 doubleValue];
      double v16 = v15;

      if (v16 <= 0.0)
      {
        [(BSUIWeeklyProgressView *)self _animateProgressTodayIfNeeded];
      }
      else
      {
        dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_36244;
        block[3] = &unk_38E738;
        block[4] = self;
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  else
  {
  }
}

- (void)dynamicProgressChanged:(id)a3
{
  id v4 = a3;
  double v5 = [(BSUIWeeklyProgressView *)self metrics];
  id v6 = [v5 dailyReadingGoal];

  if (v6)
  {
    id v7 = [v4 progress];
    [v7 floatValue];
    float v9 = v8;
    uint64_t v10 = [(BSUIWeeklyProgressView *)self metrics];
    -[BSUIWeeklyProgressView setProgressToday:](self, "setProgressToday:", (float)(v9 / (float)(uint64_t)[v10 dailyReadingGoal]));

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_36350;
    block[3] = &unk_38E738;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  [(BSUIWeeklyProgressView *)self frame];
  id v4 = NSStringFromCGRect(v9);
  double v5 = [(BSUIWeeklyProgressView *)self layoutInfosToDisplay];
  id v6 = +[NSMutableString stringWithFormat:@"%@: %p frame=%@, layoutType: %@", v3, self, v4, v5];

  return (NSString *)v6;
}

- (BSUIWeeklyProgressMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (_BSUIWeeklyProgressRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (NSArray)days
{
  return self->_days;
}

- (void)setDays:(id)a3
{
}

- (double)progressToday
{
  return self->_progressToday;
}

- (void)setProgressToday:(double)a3
{
  self->_double progressToday = a3;
}

- (BSUIDynamicValue)lastVisibleProgressToday
{
  return self->_lastVisibleProgressToday;
}

- (void)setLastVisibleProgressToday:(id)a3
{
}

- (NSArray)layoutInfosToDisplay
{
  return self->_layoutInfosToDisplay;
}

- (void)setLayoutInfosToDisplay:(id)a3
{
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (BOOL)runningStreakFromPreviousWeek
{
  return self->_runningStreakFromPreviousWeek;
}

- (void)setRunningStreakFromPreviousWeek:(BOOL)a3
{
  self->_runningStreakFromPreviousWeek = a3;
}

- (int64_t)lastAXValue
{
  return self->_lastAXValue;
}

- (void)setLastAXValue:(int64_t)a3
{
  self->_lastAXValue = a3;
}

- (NSString)dateOfLastDay
{
  return self->_dateOfLastDay;
}

- (void)setDateOfLastDay:(id)a3
{
}

- (_BSUIWeeklyProgressLayoutInfo)todayLayoutInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_todayLayoutInfo);

  return (_BSUIWeeklyProgressLayoutInfo *)WeakRetained;
}

- (void)setTodayLayoutInfo:(id)a3
{
}

- (_BSUIWeeklyProgressLayoutInfo)todaySeparatorLayoutInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_todaySeparatorLayoutInfo);

  return (_BSUIWeeklyProgressLayoutInfo *)WeakRetained;
}

- (void)setTodaySeparatorLayoutInfo:(id)a3
{
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_destroyWeak((id *)&self->_todaySeparatorLayoutInfo);
  objc_destroyWeak((id *)&self->_todayLayoutInfo);
  objc_storeStrong((id *)&self->_dateOfLastDay, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_layoutInfosToDisplay, 0);
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, 0);
  objc_storeStrong((id *)&self->_days, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end