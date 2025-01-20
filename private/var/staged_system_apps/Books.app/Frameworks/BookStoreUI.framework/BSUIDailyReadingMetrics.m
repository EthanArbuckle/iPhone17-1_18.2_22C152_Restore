@interface BSUIDailyReadingMetrics
+ (id)attributesKindMapping;
+ (id)elementName;
+ (id)supportedAttributes;
+ (unint64_t)defaultKindForAttribute:(unsigned __int16)a3;
+ (void)registerAttributes;
- (BOOL)clockTicks;
- (BOOL)goalCompleted;
- (BOOL)iconMode;
- (BOOL)isAX;
- (BOOL)useFontFallback;
- (BOOL)useLargeLayoutMode;
- (BOOL)useNarrowLayoutMode;
- (BSUIDailyReadingMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5;
- (BSUIDynamicValue)dynamicCompletedReadingGoal;
- (BSUIDynamicValue)dynamicStreakDayGoal;
- (BSUIDynamicValue)dynamicTimeReadToday;
- (BSUIDynamicValue)lastVisibleProgressToday;
- (NSNumber)actualReadingTimeSeconds;
- (NSNumber)arcWidth;
- (NSNumber)axValue;
- (NSNumber)contentsScale;
- (NSNumber)nightMode;
- (NSNumber)opacity;
- (NSNumber)progressBarWidth;
- (NSNumber)readingGoalSeconds;
- (NSNumber)rightToLeft;
- (NSNumber)triggerDelay;
- (NSString)detailText;
- (NSString)name;
- (NSString)timeDisplayedText;
- (NSString)timeSeparator;
- (NSString)title;
- (NSString)triggerName;
- (TUIFontSpec)detailFontSpec;
- (TUIFontSpec)timeFontSpec;
- (TUIFontSpec)titleFontSpec;
- (UIColor)backgroundColor;
- (UIColor)controlColor;
- (UIColor)progressColor;
- (UIColor)textColor;
- (double)progressToday;
- (id)description;
- (unint64_t)targetTriggerState;
- (void)configureIconMode:(BOOL)a3;
- (void)defaultsMissingMetrics;
- (void)parseDailyReadingData:(id)a3;
- (void)setActualReadingTimeSeconds:(id)a3;
- (void)setArcWidth:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClockTicks:(BOOL)a3;
- (void)setControlColor:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setIconMode:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOpacity:(id)a3;
- (void)setProgressBarWidth:(id)a3;
- (void)setProgressColor:(id)a3;
- (void)setProgressToday:(double)a3;
- (void)setReadingGoalSeconds:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTimeDisplayedText:(id)a3;
- (void)setTimeFontSpec:(id)a3;
- (void)setTimeSeparator:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseLargeLayoutMode:(BOOL)a3;
- (void)setUseNarrowLayoutMode:(BOOL)a3;
- (void)updateWithConfiguration:(id)a3 context:(id)a4;
@end

@implementation BSUIDailyReadingMetrics

+ (id)elementName
{
  return @"daily-reading";
}

+ (void)registerAttributes
{
  BSUIAttributeDailyReadingData = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"daily-reading-data"];
  BSUIAttributeIconMode = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"icon-mode"];
  BSUIAttributeDetailText = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"detail-text"];
  BSUIAttributeTimeDisplayedText = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"time-displayed-text"];
  BSUIAttributeReadingTime = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"current-reading-time"];
  BSUIAttributeReadingGoal = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"goal-reading-time"];
  BSUIAttributeProgressToday = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"progress-today"];
  BSUIAttributeControlColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"control-color"];
  BSUIAttributeProgressColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"progress-color"];
  BSUIAttributeTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"text-color"];
  BSUIAttributeNightMode = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"night-mode"];
  BSUIAttributeRightToLeft = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"right-to-left"];
}

+ (id)supportedAttributes
{
  if (qword_3D40D0 != -1) {
    dispatch_once(&qword_3D40D0, &stru_38E910);
  }
  v2 = (void *)qword_3D40C8;

  return v2;
}

+ (id)attributesKindMapping
{
  if (qword_3D40E0 != -1) {
    dispatch_once(&qword_3D40E0, &stru_38E930);
  }
  v2 = (void *)qword_3D40D8;

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

- (BSUIDailyReadingMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v86.receiver = self;
  v86.super_class = (Class)BSUIDailyReadingMetrics;
  v10 = [(BSUIDailyReadingMetrics *)&v86 init];
  if (v10)
  {
    objc_opt_class();
    uint64_t var0 = a3.var0;
    v12 = [v8 stringForAttribute:137 node:a3.var0];
    BUDynamicCast();
    v83 = (NSString *)objc_claimAutoreleasedReturnValue();

    [v8 floatForAttribute:(unsigned __int16)BSUIAttributeReadingGoal node:var0];
    uint64_t v73 = (uint64_t)fmax(v13, 0.0);
    [v8 floatForAttribute:(unsigned __int16)BSUIAttributeReadingTime node:var0];
    uint64_t v77 = (uint64_t)fmax(v14, 0.0);
    [v8 floatForAttribute:(unsigned __int16)BSUIAttributeProgressToday node:var0];
    double v16 = fmax(v15, 0.0);
    unsigned int v17 = [v8 BOOLForAttribute:(unsigned __int16)BSUIAttributeIconMode node:var0];
    v18 = [v8 stringForAttribute:204 node:var0];
    v19 = [v8 stringForAttribute:(unsigned __int16)BSUIAttributeDetailText node:var0];
    v64 = [v8 stringForAttribute:(unsigned __int16)BSUIAttributeTimeDisplayedText node:var0];
    v66 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeControlColor node:var0];
    v68 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeProgressColor node:var0];
    v71 = [v8 colorForAttribute:30 node:var0];
    v75 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeTextColor node:var0];
    uint64_t v20 = [v8 fontSpecForNode:var0];
    uint64_t v21 = 8;
    if (v17) {
      uint64_t v21 = 3;
    }
    v81 = (TUIFontSpec *)v20;
    uint64_t v82 = v21;
    v22 = [v9 environment];
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 contentSizeCategory]);
    v80 = (NSNumber *)objc_claimAutoreleasedReturnValue();

    v23 = [v9 environment];
    BOOL v79 = [v23 style] == (char *)&dword_0 + 2;

    v24 = [v9 environment];
    BOOL v72 = [v24 layoutDirection] == (char *)&dword_0 + 2;

    v25 = [v9 environment];
    [v25 contentsScale];
    double v27 = v26;

    v70 = [v8 stringForAttribute:142 node:var0];
    [v8 floatForAttribute:143 node:var0];
    double v29 = v28;
    v30 = [v8 stringForAttribute:144 node:var0];
    id v76 = +[TUIBox triggerStateFromString:v30];

    v31 = [v9 environment];
    unsigned __int8 v85 = [v31 useFontFallback];

    name = v10->_name;
    v10->_name = v83;
    v84 = v83;

    uint64_t v33 = +[NSNumber numberWithInteger:v73];
    readingGoalSeconds = v10->_readingGoalSeconds;
    v10->_readingGoalSeconds = (NSNumber *)v33;

    uint64_t v35 = +[NSNumber numberWithInteger:v77];
    actualReadingTimeSeconds = v10->_actualReadingTimeSeconds;
    v10->_actualReadingTimeSeconds = (NSNumber *)v35;

    v10->_progressToday = v16;
    v10->_iconMode = v17;
    title = v10->_title;
    v10->_title = v18;
    v78 = v18;

    detailText = v10->_detailText;
    v10->_detailText = v19;
    v74 = v19;

    timeDisplayedText = v10->_timeDisplayedText;
    v10->_timeDisplayedText = v64;
    v65 = v64;

    controlColor = v10->_controlColor;
    v10->_controlColor = v66;
    v67 = v66;

    progressColor = v10->_progressColor;
    v10->_progressColor = v68;
    v69 = v68;

    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = v71;
    v43 = v71;

    textColor = v10->_textColor;
    v10->_textColor = v75;
    v45 = v75;

    timeFontSpec = v10->_timeFontSpec;
    v10->_timeFontSpec = v81;
    v47 = v81;

    uint64_t v48 = +[NSNumber numberWithInteger:v82];
    progressBarWidth = v10->_progressBarWidth;
    v10->_progressBarWidth = (NSNumber *)v48;

    axValue = v10->_axValue;
    v10->_axValue = v80;
    v51 = v80;

    uint64_t v52 = +[NSNumber numberWithBool:v79];
    nightMode = v10->_nightMode;
    v10->_nightMode = (NSNumber *)v52;

    uint64_t v54 = +[NSNumber numberWithBool:v72];
    rightToLeft = v10->_rightToLeft;
    v10->_rightToLeft = (NSNumber *)v54;

    uint64_t v56 = +[NSNumber numberWithDouble:v27];
    contentsScale = v10->_contentsScale;
    v10->_contentsScale = (NSNumber *)v56;

    triggerName = v10->_triggerName;
    v10->_triggerName = v70;
    v59 = v70;

    uint64_t v60 = +[NSNumber numberWithDouble:v29];
    triggerDelay = v10->_triggerDelay;
    v10->_triggerDelay = (NSNumber *)v60;

    v10->_clockTicks = 0;
    timeSeparator = v10->_timeSeparator;
    v10->_targetTriggerState = (unint64_t)v76;
    v10->_timeSeparator = 0;

    v10->_useFontFallback = v85;
    [(BSUIDailyReadingMetrics *)v10 defaultsMissingMetrics];
  }

  return v10;
}

- (void)updateWithConfiguration:(id)a3 context:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = [v5 dataForKey:@"daily-reading-data"];
  BUDynamicCast();
  id v35 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v5 dataForKey:@"current-reading-time"];
  objc_opt_class();
  objc_opt_class();
  id v8 = BUDynamicCast();
  id v9 = [v8 value];
  v30 = (void *)v7;
  v10 = BUDynamicCast();

  objc_opt_class();
  v11 = [v5 dataForKey:@"goal-reading-time"];
  double v29 = BUDynamicCast();

  id v12 = v10;
  objc_opt_class();
  double v13 = [v5 dataForKey:@"progress-today"];
  v34 = BUDynamicCast();

  unsigned int v28 = [v5 BOOLForKey:@"icon-mode"];
  uint64_t v33 = [v5 colorForKey:@"control-color"];
  v32 = [v5 colorForKey:@"progress-color"];
  double v14 = [v5 colorForKey:@"background-color"];
  double v15 = [v5 colorForKey:@"text-color"];
  objc_opt_class();
  double v16 = [v5 dataForKey:@"arc-width"];
  v31 = BUDynamicCast();

  objc_opt_class();
  unsigned int v17 = [v5 dataForKey:@"progress-bar-width"];
  v18 = BUDynamicCast();

  objc_opt_class();
  v19 = [v5 dataForKey:@"opacity"];
  uint64_t v20 = BUDynamicCast();
  uint64_t v21 = (void *)v20;
  v22 = &off_3A0BD8;
  if (v20) {
    v22 = (_UNKNOWN **)v20;
  }
  v23 = v22;

  v24 = [v5 fontSpecForKey:@"time-text-style"];
  id v25 = [v5 BOOLForKey:@"clock-ticks"];
  double v26 = [v5 stringForKey:@"time-separator"];

  if (v35) {
    [(BSUIDailyReadingMetrics *)self parseDailyReadingData:v35];
  }
  if (v29) {
    [(BSUIDailyReadingMetrics *)self setReadingGoalSeconds:v29];
  }
  if (v12) {
    [(BSUIDailyReadingMetrics *)self setActualReadingTimeSeconds:v12];
  }
  if (v34)
  {
    [v34 floatValue];
    [(BSUIDailyReadingMetrics *)self setProgressToday:v27];
  }
  if (v28) {
    [(BSUIDailyReadingMetrics *)self configureIconMode:1];
  }
  if (v33) {
    -[BSUIDailyReadingMetrics setControlColor:](self, "setControlColor:");
  }
  if (v32) {
    -[BSUIDailyReadingMetrics setProgressColor:](self, "setProgressColor:");
  }
  if (v14) {
    [(BSUIDailyReadingMetrics *)self setBackgroundColor:v14];
  }
  if (v15) {
    [(BSUIDailyReadingMetrics *)self setTextColor:v15];
  }
  [(BSUIDailyReadingMetrics *)self setArcWidth:v31];
  if (v18) {
    [(BSUIDailyReadingMetrics *)self setProgressBarWidth:v18];
  }
  if (v24) {
    [(BSUIDailyReadingMetrics *)self setTimeFontSpec:v24];
  }
  [(BSUIDailyReadingMetrics *)self setOpacity:v23];
  [(BSUIDailyReadingMetrics *)self setClockTicks:v25];
  [(BSUIDailyReadingMetrics *)self setTimeSeparator:v26];
}

- (void)defaultsMissingMetrics
{
  if (!self->_controlColor)
  {
    if ([(NSNumber *)self->_nightMode BOOLValue]) {
      +[UIColor colorWithRed:0.0980392157 green:0.0980392157 blue:0.0980392157 alpha:1.0];
    }
    else {
    uint64_t v3 = +[UIColor colorWithWhite:0.933333333 alpha:1.0];
    }
    controlColor = self->_controlColor;
    self->_controlColor = v3;
  }
  if (!self->_progressColor)
  {
    id v5 = +[UIColor colorWithRed:0.0 green:0.615686275 blue:0.862745098 alpha:1.0];
    progressColor = self->_progressColor;
    self->_progressColor = v5;
  }
  if (!self->_textColor)
  {
    if ([(NSNumber *)self->_nightMode BOOLValue]) {
      +[UIColor whiteColor];
    }
    else {
    uint64_t v7 = +[UIColor blackColor];
    }
    textColor = self->_textColor;
    self->_textColor = v7;
  }
  if (!self->_backgroundColor)
  {
    id v9 = +[UIColor clearColor];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v9;
  }
  if (!self->_detailFontSpec)
  {
    [(NSNumber *)self->_actualReadingTimeSeconds floatValue];
    float v12 = v11;
    [(NSNumber *)self->_readingGoalSeconds floatValue];
    if (v12 >= v13) {
      CFStringRef v14 = @"SFProText-Semibold";
    }
    else {
      CFStringRef v14 = @"SFProText-Regular";
    }
    self->_detailFontSpec = +[TUIFontSpec fontSpecWithPostscriptName:v14 size:15.0];
    _objc_release_x1();
  }
}

- (BOOL)isAX
{
  v2 = [(BSUIDailyReadingMetrics *)self axValue];
  BOOL v3 = (unint64_t)[v2 integerValue] > 7;

  return v3;
}

- (void)parseDailyReadingData:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  v4 = [v12 objectForKeyedSubscript:@"dynamicProgressToday"];
  id v5 = BUDynamicCast();

  if (v5) {
    objc_storeStrong((id *)&self->_lastVisibleProgressToday, v5);
  }
  objc_opt_class();
  v6 = [v12 objectForKeyedSubscript:@"streakDayGoal"];
  uint64_t v7 = BUDynamicCast();

  if (v7) {
    objc_storeStrong((id *)&self->_dynamicStreakDayGoal, v7);
  }
  objc_opt_class();
  id v8 = [v12 objectForKeyedSubscript:@"timeReadToday"];
  id v9 = BUDynamicCast();

  if (v9) {
    objc_storeStrong((id *)&self->_dynamicTimeReadToday, v9);
  }
  objc_opt_class();
  v10 = [v12 objectForKeyedSubscript:@"completedReadingGoal"];
  float v11 = BUDynamicCast();

  if (v11) {
    objc_storeStrong((id *)&self->_dynamicCompletedReadingGoal, v11);
  }
}

- (void)configureIconMode:(BOOL)a3
{
  self->_iconMode = a3;
  if (a3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 8;
  }
  self->_progressBarWidth = +[NSNumber numberWithInteger:v4];

  _objc_release_x1();
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v3);
  v41 = [(BSUIDailyReadingMetrics *)self name];
  v38 = +[NSNumber numberWithBool:[(BSUIDailyReadingMetrics *)self iconMode]];
  v39 = [(BSUIDailyReadingMetrics *)self readingGoalSeconds];
  v18 = [(BSUIDailyReadingMetrics *)self actualReadingTimeSeconds];
  [(BSUIDailyReadingMetrics *)self progressToday];
  uint64_t v5 = v4;
  v37 = [(BSUIDailyReadingMetrics *)self lastVisibleProgressToday];
  v23 = [(BSUIDailyReadingMetrics *)self lastVisibleProgressToday];
  v36 = [v23 value];
  id v35 = [(BSUIDailyReadingMetrics *)self dynamicStreakDayGoal];
  v22 = [(BSUIDailyReadingMetrics *)self dynamicStreakDayGoal];
  v32 = [v22 value];
  v34 = [(BSUIDailyReadingMetrics *)self dynamicTimeReadToday];
  uint64_t v21 = [(BSUIDailyReadingMetrics *)self dynamicTimeReadToday];
  unsigned int v17 = [v21 value];
  uint64_t v33 = [(BSUIDailyReadingMetrics *)self dynamicCompletedReadingGoal];
  v19 = [(BSUIDailyReadingMetrics *)self dynamicCompletedReadingGoal];
  v31 = [v19 value];
  double v16 = [(BSUIDailyReadingMetrics *)self title];
  v30 = [(BSUIDailyReadingMetrics *)self detailText];
  double v29 = [(BSUIDailyReadingMetrics *)self timeDisplayedText];
  unsigned int v28 = [(BSUIDailyReadingMetrics *)self controlColor];
  float v27 = [(BSUIDailyReadingMetrics *)self progressColor];
  double v26 = [(BSUIDailyReadingMetrics *)self backgroundColor];
  id v25 = [(BSUIDailyReadingMetrics *)self textColor];
  v24 = [(BSUIDailyReadingMetrics *)self timeFontSpec];
  double v15 = [(BSUIDailyReadingMetrics *)self arcWidth];
  CFStringRef v14 = [(BSUIDailyReadingMetrics *)self progressBarWidth];
  v6 = [(BSUIDailyReadingMetrics *)self axValue];
  uint64_t v7 = [(BSUIDailyReadingMetrics *)self nightMode];
  id v8 = [(BSUIDailyReadingMetrics *)self rightToLeft];
  id v9 = [(BSUIDailyReadingMetrics *)self triggerName];
  v10 = [(BSUIDailyReadingMetrics *)self triggerDelay];
  float v11 = +[NSNumber numberWithUnsignedInteger:[(BSUIDailyReadingMetrics *)self targetTriggerState]];
  id v12 = [(BSUIDailyReadingMetrics *)self opacity];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@(%p) n=%@ iconMode=%@ readingGoalSeconds=%@ actualReadingTimeSeconds=%@ progressToday=%.1f lastVisibleProgressToday=%@ [%@] dynamicStreakDayGoal=%@ [%@] dynamicTimeReadToday=%@ [%@] dynamicCompletedReadingGoal=%@ [%@] title=\"%@\" detailText=\"%@\" timeDisplayedText=\"%@\" controlColor=%@ progressColor=%@ backgroundColor=%@ textColor=%@ timeFontSpec=%@ arcWidth=%@ progressBarWidth=%@ axValue=%@ nightMode=%@ rightToLeft=%@ triggerName:%@ triggerDelay:%@ triggerState: %@ opacity: %@>", v40, self, v41, v38, v39, v18, v5, v37, v36, v35, v32, v34, v17, v33, v31, v16,
    v30,
    v29,
    v28,
    v27,
    v26,
    v25,
    v24,
    v15,
    v14,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSNumber)readingGoalSeconds
{
  return self->_readingGoalSeconds;
}

- (void)setReadingGoalSeconds:(id)a3
{
}

- (NSNumber)actualReadingTimeSeconds
{
  return self->_actualReadingTimeSeconds;
}

- (void)setActualReadingTimeSeconds:(id)a3
{
}

- (double)progressToday
{
  return self->_progressToday;
}

- (void)setProgressToday:(double)a3
{
  self->_progressToday = a3;
}

- (BSUIDynamicValue)lastVisibleProgressToday
{
  return self->_lastVisibleProgressToday;
}

- (BSUIDynamicValue)dynamicStreakDayGoal
{
  return self->_dynamicStreakDayGoal;
}

- (BSUIDynamicValue)dynamicTimeReadToday
{
  return self->_dynamicTimeReadToday;
}

- (BSUIDynamicValue)dynamicCompletedReadingGoal
{
  return self->_dynamicCompletedReadingGoal;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (void)setIconMode:(BOOL)a3
{
  self->_iconMode = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)timeDisplayedText
{
  return self->_timeDisplayedText;
}

- (void)setTimeDisplayedText:(id)a3
{
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

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (TUIFontSpec)timeFontSpec
{
  return self->_timeFontSpec;
}

- (void)setTimeFontSpec:(id)a3
{
}

- (TUIFontSpec)titleFontSpec
{
  return self->_titleFontSpec;
}

- (TUIFontSpec)detailFontSpec
{
  return self->_detailFontSpec;
}

- (NSNumber)arcWidth
{
  return self->_arcWidth;
}

- (void)setArcWidth:(id)a3
{
}

- (NSNumber)progressBarWidth
{
  return self->_progressBarWidth;
}

- (void)setProgressBarWidth:(id)a3
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

- (NSNumber)rightToLeft
{
  return self->_rightToLeft;
}

- (NSNumber)contentsScale
{
  return self->_contentsScale;
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (NSNumber)triggerDelay
{
  return self->_triggerDelay;
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (BOOL)clockTicks
{
  return self->_clockTicks;
}

- (void)setClockTicks:(BOOL)a3
{
  self->_clockTicks = a3;
}

- (NSString)timeSeparator
{
  return self->_timeSeparator;
}

- (void)setTimeSeparator:(id)a3
{
}

- (NSNumber)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(id)a3
{
}

- (BOOL)goalCompleted
{
  return self->_goalCompleted;
}

- (BOOL)useLargeLayoutMode
{
  return self->_useLargeLayoutMode;
}

- (void)setUseLargeLayoutMode:(BOOL)a3
{
  self->_useLargeLayoutMode = a3;
}

- (BOOL)useNarrowLayoutMode
{
  return self->_useNarrowLayoutMode;
}

- (void)setUseNarrowLayoutMode:(BOOL)a3
{
  self->_useNarrowLayoutMode = a3;
}

- (BOOL)useFontFallback
{
  return self->_useFontFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacity, 0);
  objc_storeStrong((id *)&self->_timeSeparator, 0);
  objc_storeStrong((id *)&self->_triggerDelay, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_contentsScale, 0);
  objc_storeStrong((id *)&self->_rightToLeft, 0);
  objc_storeStrong((id *)&self->_nightMode, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_progressBarWidth, 0);
  objc_storeStrong((id *)&self->_arcWidth, 0);
  objc_storeStrong((id *)&self->_detailFontSpec, 0);
  objc_storeStrong((id *)&self->_titleFontSpec, 0);
  objc_storeStrong((id *)&self->_timeFontSpec, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_controlColor, 0);
  objc_storeStrong((id *)&self->_timeDisplayedText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dynamicCompletedReadingGoal, 0);
  objc_storeStrong((id *)&self->_dynamicTimeReadToday, 0);
  objc_storeStrong((id *)&self->_dynamicStreakDayGoal, 0);
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, 0);
  objc_storeStrong((id *)&self->_actualReadingTimeSeconds, 0);

  objc_storeStrong((id *)&self->_readingGoalSeconds, 0);
}

@end