@interface BSUIReadingGoalsGaugeMetrics
+ (id)attributesKindMapping;
+ (id)elementName;
+ (id)supportedAttributes;
+ (unint64_t)defaultKindForAttribute:(unsigned __int16)a3;
+ (void)registerAttributes;
- (BOOL)isAX;
- (BOOL)isEqual:(id)a3;
- (BSUIReadingGoalsGaugeMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5;
- (CGSize)size;
- (NSNumber)actualReadingTimeSeconds;
- (NSNumber)axValue;
- (NSNumber)nightMode;
- (NSNumber)opacity;
- (NSNumber)readingGoalSeconds;
- (NSString)name;
- (NSString)title;
- (TUIDynamicProgress)readingProgress;
- (TUIFontSpec)streakFontSpec;
- (TUIFontSpec)timeFontSpec;
- (UIColor)controlColor;
- (UIColor)progressColor;
- (void)dealloc;
- (void)defaultsMissingMetrics;
- (void)dynamicProgressChanged:(id)a3;
- (void)setActualReadingTimeSeconds:(id)a3;
- (void)setControlColor:(id)a3;
- (void)setOpacity:(id)a3;
- (void)setProgressColor:(id)a3;
- (void)setReadingGoalSeconds:(id)a3;
- (void)setReadingProgress:(id)a3;
- (void)setStreakFontSpec:(id)a3;
- (void)setTimeFontSpec:(id)a3;
- (void)updateWithConfiguration:(id)a3 context:(id)a4;
@end

@implementation BSUIReadingGoalsGaugeMetrics

+ (id)elementName
{
  return @"reading-goals-gauge";
}

+ (void)registerAttributes
{
  BSUIAttributeControlColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"control-color"];
  BSUIAttributeProgressColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"progress-color"];
  BSUIAttributeNightMode = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"night-mode"];
}

+ (id)supportedAttributes
{
  if (qword_3D4028 != -1) {
    dispatch_once(&qword_3D4028, &stru_38E048);
  }
  v2 = (void *)qword_3D4020;

  return v2;
}

+ (id)attributesKindMapping
{
  if (qword_3D4038 != -1) {
    dispatch_once(&qword_3D4038, &stru_38E068);
  }
  v2 = (void *)qword_3D4030;

  return v2;
}

+ (unint64_t)defaultKindForAttribute:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [a1 attributesKindMapping];
  if (v3)
  {
    v5 = +[TUIAttributeRegistry nameForAttribute:v3];
    v6 = [v4 objectForKeyedSubscript:v5];
    id v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (BSUIReadingGoalsGaugeMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v36.receiver = self;
  v36.super_class = (Class)BSUIReadingGoalsGaugeMetrics;
  v10 = [(BSUIReadingGoalsGaugeMetrics *)&v36 init];
  if (v10)
  {
    objc_opt_class();
    v11 = [v8 stringForAttribute:137 node:a3.var0];
    BUDynamicCast();
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    v13 = [v8 stringForAttribute:204 node:a3.var0];
    v14 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeControlColor node:a3.var0];
    v15 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeProgressColor node:a3.var0];
    v16 = [v9 environment];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 contentSizeCategory]);
    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    [v9 environment];
    v18 = id v35 = v9;
    BOOL v19 = [v18 style] == (char *)&dword_0 + 2;

    name = v10->_name;
    v10->_name = v12;
    v34 = v12;

    title = v10->_title;
    v10->_title = v13;
    v22 = v13;

    controlColor = v10->_controlColor;
    v10->_controlColor = v14;
    v24 = v14;

    progressColor = v10->_progressColor;
    v10->_progressColor = v15;
    v26 = v15;

    axValue = v10->_axValue;
    v10->_axValue = v17;
    v28 = v17;

    uint64_t v29 = +[NSNumber numberWithBool:v19];
    nightMode = v10->_nightMode;
    v10->_nightMode = (NSNumber *)v29;

    id v9 = v35;
    CGFloat v31 = COERCE_FLOAT([v8 lengthForAttribute:223 node:a3.var0]);
    float v32 = COERCE_FLOAT([v8 lengthForAttribute:98 node:a3.var0]);
    v10->_size.width = v31;
    v10->_size.height = v32;
    [(BSUIReadingGoalsGaugeMetrics *)v10 defaultsMissingMetrics];
  }

  return v10;
}

- (void)dealloc
{
  [(TUIDynamicProgress *)self->_readingProgress unregisterProgressObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)BSUIReadingGoalsGaugeMetrics;
  [(BSUIReadingGoalsGaugeMetrics *)&v3 dealloc];
}

- (void)updateWithConfiguration:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v29 = [v5 colorForKey:@"control-color"];
  uint64_t v6 = [v5 colorForKey:@"progress-color"];
  uint64_t v7 = [v5 dataForKey:@"current-reading-time"];
  objc_opt_class();
  objc_opt_class();
  id v8 = BUDynamicCast();
  id v9 = [v8 value];
  v27 = (void *)v7;
  v10 = BUDynamicCast();

  id v11 = v10;
  objc_opt_class();
  v12 = [v5 dataForKey:@"goal-reading-time"];
  v13 = BUDynamicCast();

  objc_opt_class();
  v14 = [v5 dataForKey:@"opacity"];
  uint64_t v15 = BUDynamicCast();
  v16 = (void *)v15;
  v17 = &off_3A0BA8;
  if (v15) {
    v17 = (_UNKNOWN **)v15;
  }
  v18 = v17;

  BOOL v19 = [v5 fontSpecForKey:@"time-text-style"];
  v20 = [v5 fontSpecForKey:@"streak-day-text-style"];

  if (v29) {
    [(BSUIReadingGoalsGaugeMetrics *)self setControlColor:v29];
  }
  if (v6) {
    [(BSUIReadingGoalsGaugeMetrics *)self setProgressColor:v6];
  }
  if (v11) {
    [(BSUIReadingGoalsGaugeMetrics *)self setActualReadingTimeSeconds:v11];
  }
  if (v13) {
    [(BSUIReadingGoalsGaugeMetrics *)self setReadingGoalSeconds:v13];
  }
  if (v19) {
    [(BSUIReadingGoalsGaugeMetrics *)self setTimeFontSpec:v19];
  }
  v28 = (void *)v6;
  if (v20) {
    [(BSUIReadingGoalsGaugeMetrics *)self setStreakFontSpec:v20];
  }
  v21 = +[BSUITemplate manager];
  v22 = [v21 dynamicRegistry];

  v23 = +[BCReadingTimeToday kind];
  v24 = [v22 progressProviderForKind:v23];
  v25 = [v24 dynamicProgressForKind:v23 instance:0 parameters:0];
  [(BSUIReadingGoalsGaugeMetrics *)self setReadingProgress:v25];

  v26 = [(BSUIReadingGoalsGaugeMetrics *)self readingProgress];
  [v26 registerProgressObserver:self];

  [(BSUIReadingGoalsGaugeMetrics *)self setOpacity:v18];
}

- (void)defaultsMissingMetrics
{
  if (!self->_controlColor)
  {
    if ([(NSNumber *)self->_nightMode BOOLValue]) {
      +[UIColor colorWithRed:0.0980392157 green:0.0980392157 blue:0.0980392157 alpha:1.0];
    }
    else {
    objc_super v3 = +[UIColor colorWithWhite:0.933333333 alpha:1.0];
    }
    controlColor = self->_controlColor;
    self->_controlColor = v3;
  }
  if (!self->_progressColor)
  {
    self->_progressColor = +[UIColor colorWithRed:0.0 green:0.615686275 blue:0.862745098 alpha:1.0];
    _objc_release_x1();
  }
}

- (BOOL)isAX
{
  v2 = [(BSUIReadingGoalsGaugeMetrics *)self axValue];
  BOOL v3 = (unint64_t)[v2 integerValue] > 7;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  objc_opt_class();
  uint64_t v6 = [v5 axValue];
  uint64_t v7 = BUDynamicCast();

  uint64_t v8 = [(BSUIReadingGoalsGaugeMetrics *)self axValue];
  if (v8 | v7)
  {
    id v9 = [(BSUIReadingGoalsGaugeMetrics *)self axValue];
    unsigned __int8 v10 = 0;
    if (v9 && v7)
    {
      id v11 = [(BSUIReadingGoalsGaugeMetrics *)self axValue];
      unsigned __int8 v10 = [v11 isEqualToNumber:v7];
    }
    char v31 = v10;
  }
  else
  {
    char v31 = 1;
  }

  objc_opt_class();
  v12 = [v5 nightMode];
  uint64_t v13 = BUDynamicCast();

  uint64_t v14 = [(BSUIReadingGoalsGaugeMetrics *)self nightMode];
  if (v14 | v13)
  {
    uint64_t v15 = [(BSUIReadingGoalsGaugeMetrics *)self nightMode];
    unsigned __int8 v16 = 0;
    if (v15 && v13)
    {
      v17 = [(BSUIReadingGoalsGaugeMetrics *)self nightMode];
      unsigned __int8 v16 = [v17 isEqualToNumber:v13];
    }
    char v30 = v16;
  }
  else
  {
    char v30 = 1;
  }

  objc_opt_class();
  v18 = [v5 opacity];
  uint64_t v19 = BUDynamicCast();

  uint64_t v20 = [(BSUIReadingGoalsGaugeMetrics *)self opacity];
  if (v20 | v19)
  {
    v21 = [(BSUIReadingGoalsGaugeMetrics *)self opacity];
    unsigned __int8 v22 = 0;
    if (v21 && v19)
    {
      v23 = [(BSUIReadingGoalsGaugeMetrics *)self opacity];
      unsigned __int8 v22 = [v23 isEqualToNumber:v19];
    }
  }
  else
  {
    unsigned __int8 v22 = 1;
  }

  if (v5)
  {
    v24 = [(BSUIReadingGoalsGaugeMetrics *)self timeFontSpec];
    v25 = [v5 timeFontSpec];
    if ([v24 isEqual:v25])
    {
      v26 = [(BSUIReadingGoalsGaugeMetrics *)self streakFontSpec];
      v27 = [v5 streakFontSpec];
      if ([v26 isEqual:v27]) {
        char v28 = v31 & v30 & v22;
      }
      else {
        char v28 = 0;
      }
    }
    else
    {
      char v28 = 0;
    }
  }
  else
  {
    char v28 = 0;
  }

  return v28;
}

- (void)dynamicProgressChanged:(id)a3
{
  id v7 = a3;
  id v4 = [v7 progress];

  if (v4)
  {
    id v5 = [v7 progress];
    [v5 doubleValue];
    uint64_t v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(BSUIReadingGoalsGaugeMetrics *)self setActualReadingTimeSeconds:v6];
  }
}

- (NSString)name
{
  return self->_name;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)controlColor
{
  return self->_controlColor;
}

- (void)setControlColor:(id)a3
{
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (void)setProgressColor:(id)a3
{
}

- (NSNumber)axValue
{
  return self->_axValue;
}

- (NSNumber)nightMode
{
  return self->_nightMode;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSNumber)actualReadingTimeSeconds
{
  return self->_actualReadingTimeSeconds;
}

- (void)setActualReadingTimeSeconds:(id)a3
{
}

- (NSNumber)readingGoalSeconds
{
  return self->_readingGoalSeconds;
}

- (void)setReadingGoalSeconds:(id)a3
{
}

- (TUIFontSpec)timeFontSpec
{
  return self->_timeFontSpec;
}

- (void)setTimeFontSpec:(id)a3
{
}

- (TUIFontSpec)streakFontSpec
{
  return self->_streakFontSpec;
}

- (void)setStreakFontSpec:(id)a3
{
}

- (NSNumber)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(id)a3
{
}

- (TUIDynamicProgress)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingProgress, 0);
  objc_storeStrong((id *)&self->_opacity, 0);
  objc_storeStrong((id *)&self->_streakFontSpec, 0);
  objc_storeStrong((id *)&self->_timeFontSpec, 0);
  objc_storeStrong((id *)&self->_readingGoalSeconds, 0);
  objc_storeStrong((id *)&self->_actualReadingTimeSeconds, 0);
  objc_storeStrong((id *)&self->_nightMode, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_controlColor, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end