@interface BSUIWeeklyProgressMetrics
+ (id)attributesKindMapping;
+ (id)elementName;
+ (id)parseCalendarData:(id)a3;
+ (id)supportedAttributes;
+ (unint64_t)defaultKindForAttribute:(unsigned __int16)a3;
+ (void)registerAttributes;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunningStreak;
- (BSUIDynamicValue)lastVisibleProgressToday;
- (BSUIWeeklyProgressMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5;
- (NSArray)days;
- (NSNumber)axValue;
- (NSNumber)nightMode;
- (NSNumber)rightToLeft;
- (NSNumber)spacerHeight;
- (NSNumber)spacerWidth;
- (NSNumber)triggerDelay;
- (NSString)currentDayShortString;
- (NSString)triggerName;
- (TUIFontSpec)fontSpec;
- (UIColor)backgroundColor;
- (UIColor)completedTextColor;
- (UIColor)controlColor;
- (UIColor)futureDayTextColor;
- (UIColor)previousDayBackgroundColor;
- (UIColor)previousDayBorderColor;
- (UIColor)previousDayTextColor;
- (UIColor)progressColor;
- (UIColor)textColor;
- (double)progressToday;
- (id)description;
- (int64_t)dailyReadingGoal;
- (unint64_t)targetTriggerState;
- (void)parseCalendarData:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCompletedTextColor:(id)a3;
- (void)setControlColor:(id)a3;
- (void)setCurrentDayShortString:(id)a3;
- (void)setDailyReadingGoal:(int64_t)a3;
- (void)setDays:(id)a3;
- (void)setFontSpec:(id)a3;
- (void)setFutureDayTextColor:(id)a3;
- (void)setIsRunningStreak:(BOOL)a3;
- (void)setLastVisibleProgressToday:(id)a3;
- (void)setPreviousDayBackgroundColor:(id)a3;
- (void)setPreviousDayBorderColor:(id)a3;
- (void)setPreviousDayTextColor:(id)a3;
- (void)setProgressColor:(id)a3;
- (void)setProgressToday:(double)a3;
- (void)setSpacerHeight:(id)a3;
- (void)setSpacerWidth:(id)a3;
- (void)setTargetTriggerState:(unint64_t)a3;
- (void)setTextColor:(id)a3;
- (void)updateWithConfiguration:(id)a3 context:(id)a4;
@end

@implementation BSUIWeeklyProgressMetrics

+ (id)elementName
{
  return @"weekly-progress";
}

+ (void)registerAttributes
{
  BSUIAttributeCalendarData = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"calendar-data"];
  BSUIAttributeCompletedTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"completed-text-color"];
  BSUIAttributeFutureDayTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"future-day-text-color"];
  BSUIAttributePreviousDayBorderColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"previous-day-border-color"];
  BSUIAttributePreviousDayTextColor = (unsigned __int16)+[TUIAttributeRegistry registerCustomAttributeWithName:@"previous-day-text-color"];
}

+ (id)supportedAttributes
{
  if (qword_3D4138 != -1) {
    dispatch_once(&qword_3D4138, &stru_38EE60);
  }
  v2 = (void *)qword_3D4130;

  return v2;
}

+ (id)attributesKindMapping
{
  if (qword_3D4148 != -1) {
    dispatch_once(&qword_3D4148, &stru_38EE80);
  }
  v2 = (void *)qword_3D4140;

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

- (BSUIWeeklyProgressMetrics)initWithNode:(id)a3 attributes:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v108.receiver = self;
  v108.super_class = (Class)BSUIWeeklyProgressMetrics;
  v10 = [(BSUIWeeklyProgressMetrics *)&v108 init];
  if (!v10) {
    goto LABEL_39;
  }
  objc_opt_class();
  uint64_t var0 = a3.var0;
  v12 = [v8 objectForAttribute:(unsigned __int16)BSUIAttributeCalendarData node:a3.var0];
  v13 = BUDynamicCast();

  v86 = [(id)objc_opt_class() parseCalendarData:v13];
  objc_opt_class();
  v14 = [v13 objectForKeyedSubscript:@"runningStreak"];
  v15 = BUDynamicCast();
  unsigned __int8 v94 = [v15 BOOLValue];

  objc_opt_class();
  v16 = [v13 objectForKeyedSubscript:@"dailyReadingGoal"];
  v17 = BUDynamicCast();
  id v90 = [v17 integerValue];

  [v8 floatForAttribute:(unsigned __int16)BSUIAttributeProgressToday node:var0];
  double v19 = v18;
  objc_opt_class();
  v97 = v13;
  v20 = [v13 objectForKeyedSubscript:@"dynamicProgressToday"];
  BUDynamicCast();
  v88 = (BSUIDynamicValue *)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeControlColor node:var0];
  uint64_t v22 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeProgressColor node:var0];
  uint64_t v83 = [v8 colorForAttribute:30 node:var0];
  uint64_t v85 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeTextColor node:var0];
  v101 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeCompletedTextColor node:var0];
  v107 = [v8 fontSpecForNode:var0];
  v23 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributeFutureDayTextColor node:var0];
  v24 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributePreviousDayBorderColor node:var0];
  uint64_t v105 = [v8 colorForAttribute:(unsigned __int16)BSUIAttributePreviousDayTextColor node:var0];
  v25 = [v9 environment];
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 contentSizeCategory]);
  v92 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  v26 = [v9 environment];
  v103 = (char *)[v26 style];

  id v98 = v9;
  v27 = [v9 environment];
  v82 = (char *)[v27 layoutDirection];

  v93 = [v8 stringForAttribute:142 node:var0];
  [v8 floatForAttribute:143 node:var0];
  double v29 = v28;
  v30 = [v8 stringForAttribute:144 node:var0];
  id v96 = +[TUIBox triggerStateFromString:v30];

  v99 = (UIColor *)v21;
  if (!v21)
  {
    +[UIColor colorWithWhite:dbl_2FCC20[v103 == (unsigned char *)&dword_0 + 2] alpha:1.0];
    v99 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (UIColor *)v22;
  if (!v22)
  {
    v31 = +[UIColor colorWithRed:0.0 green:0.615686275 blue:0.862745098 alpha:1.0];
  }
  v32 = (UIColor *)v83;
  v33 = (UIColor *)v85;
  if (v83)
  {
    if (v85) {
      goto LABEL_16;
    }
    if (v103 != (unsigned char *)&dword_0 + 2)
    {
LABEL_14:
      uint64_t v34 = +[UIColor blackColor];
      goto LABEL_15;
    }
  }
  else
  {
    if (v103 != (unsigned char *)&dword_0 + 2)
    {
      v32 = +[UIColor colorWithRed:0.235294118 green:0.235294118 blue:0.262745098 alpha:0.3];
      if (v85) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    v32 = +[UIColor colorWithWhite:0.2 alpha:1.0];
    if (v85) {
      goto LABEL_16;
    }
  }
  uint64_t v34 = +[UIColor whiteColor];
LABEL_15:
  v33 = (UIColor *)v34;
LABEL_16:
  if (v101)
  {
    if (v23) {
      goto LABEL_18;
    }
  }
  else
  {
    v101 = +[UIColor whiteColor];
    if (v23)
    {
LABEL_18:
      if (!v24)
      {
        double v35 = 0.0;
        if (v103 != (unsigned char *)&dword_0 + 2) {
          goto LABEL_26;
        }
        goto LABEL_24;
      }
      goto LABEL_27;
    }
  }
  if (v103 == (unsigned char *)&dword_0 + 2)
  {
    v23 = +[UIColor colorWithWhite:0.301960784 alpha:1.0];
    if (!v24)
    {
LABEL_24:
      double v35 = 1.0;
LABEL_26:
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v35, 0.15, v82);
      v24 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v35 = 0.0;
    v23 = +[UIColor colorWithWhite:0.0 alpha:0.2];
    if (!v24) {
      goto LABEL_26;
    }
  }
LABEL_27:
  uint64_t v36 = v105;
  if (!v105)
  {
    if (v103 == (unsigned char *)&dword_0 + 2)
    {
      double v37 = 0.45;
      double v38 = 1.0;
    }
    else
    {
      double v37 = 0.2;
      double v38 = 0.0;
    }
    uint64_t v36 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v38, v37, v82);
  }
  v106 = (UIColor *)v36;
  double v39 = fmax(v19, 0.0);
  if (!v107 || ([v107 font], v40 = objc_claimAutoreleasedReturnValue(), v40, !v40))
  {
    v41 = +[TUIFontSpec defaultFontSpec];
    v42 = [v41 fontSpecWithDesign:UIFontDescriptorSystemDesignDefault];
    [v42 fontSpecWithWeight:UIFontWeightSemibold];
    id v43 = v8;
    v44 = v23;
    v46 = v45 = v33;
    [v46 fontSpecWithPointSize:12.0];
    uint64_t v47 = v84 = v31;

    v33 = v45;
    v23 = v44;
    id v8 = v43;

    v107 = (void *)v47;
    v31 = v84;
  }
  BOOL v48 = v103 == (unsigned char *)&dword_0 + 2;
  if ((unint64_t)[(NSNumber *)v10->_axValue integerValue] <= 6) {
    double v49 = 12.0;
  }
  else {
    double v49 = 6.0;
  }
  days = v10->_days;
  v10->_days = v86;
  v104 = v86;

  v10->_isRunningStreak = v94;
  v10->_progressToday = v39;
  lastVisibleProgressToday = v10->_lastVisibleProgressToday;
  v10->_dailyReadingGoal = (int64_t)v90;
  v10->_lastVisibleProgressToday = v88;
  v95 = v88;

  controlColor = v10->_controlColor;
  v10->_controlColor = v99;
  v100 = v99;

  progressColor = v10->_progressColor;
  v10->_progressColor = v31;
  v91 = v31;

  previousDayBackgroundColor = v10->_previousDayBackgroundColor;
  v10->_previousDayBackgroundColor = v32;
  v89 = v32;

  textColor = v10->_textColor;
  v10->_textColor = v33;
  v87 = v33;

  completedTextColor = v10->_completedTextColor;
  v10->_completedTextColor = v101;
  v102 = v101;

  futureDayTextColor = v10->_futureDayTextColor;
  v10->_futureDayTextColor = v23;
  v58 = v23;

  previousDayBorderColor = v10->_previousDayBorderColor;
  v10->_previousDayBorderColor = v24;
  v60 = v24;

  previousDayTextColor = v10->_previousDayTextColor;
  v10->_previousDayTextColor = v106;
  v62 = v106;

  fontSpec = v10->_fontSpec;
  v10->_fontSpec = (TUIFontSpec *)v107;
  id v64 = v107;

  uint64_t v65 = +[NSNumber numberWithDouble:v49];
  spacerWidth = v10->_spacerWidth;
  v10->_spacerWidth = (NSNumber *)v65;

  uint64_t v67 = +[NSNumber numberWithDouble:3.0];
  spacerHeight = v10->_spacerHeight;
  v10->_spacerHeight = (NSNumber *)v67;

  axValue = v10->_axValue;
  v10->_axValue = v92;
  v70 = v92;

  uint64_t v71 = +[NSNumber numberWithBool:v48];
  nightMode = v10->_nightMode;
  v10->_nightMode = (NSNumber *)v71;

  uint64_t v73 = +[NSNumber numberWithBool:v82 == (unsigned char *)&dword_0 + 2];
  rightToLeft = v10->_rightToLeft;
  v10->_rightToLeft = (NSNumber *)v73;

  uint64_t v75 = +[UIColor systemBackgroundColor];
  backgroundColor = v10->_backgroundColor;
  v10->_backgroundColor = (UIColor *)v75;

  triggerName = v10->_triggerName;
  v10->_triggerName = v93;
  v78 = v93;

  uint64_t v79 = +[NSNumber numberWithDouble:v29];
  triggerDelay = v10->_triggerDelay;
  v10->_triggerDelay = (NSNumber *)v79;

  v10->_targetTriggerState = (unint64_t)v96;
  id v9 = v98;
LABEL_39:

  return v10;
}

- (void)updateWithConfiguration:(id)a3 context:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  v6 = [v5 colorForKey:@"control-color"];
  BUDynamicCast();
  id v34 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  id v7 = [v5 colorForKey:@"progress-color"];
  double v29 = BUDynamicCast();

  objc_opt_class();
  id v8 = [v5 colorForKey:@"previous-day-background-color"];
  double v28 = BUDynamicCast();

  objc_opt_class();
  id v9 = [v5 colorForKey:@"previous-day-border-color"];
  v33 = BUDynamicCast();

  objc_opt_class();
  v10 = [v5 colorForKey:@"text-color"];
  v32 = BUDynamicCast();

  objc_opt_class();
  v11 = [v5 colorForKey:@"completed-text-color"];
  v31 = BUDynamicCast();

  objc_opt_class();
  v12 = [v5 colorForKey:@"previous-day-text-color"];
  v30 = BUDynamicCast();

  objc_opt_class();
  v13 = [v5 colorForKey:@"future-day-text-color"];
  v14 = BUDynamicCast();

  objc_opt_class();
  v15 = [v5 colorForKey:@"background-color"];
  v16 = BUDynamicCast();

  objc_opt_class();
  v17 = [v5 fontSpecForKey:@"font-spec"];
  double v18 = BUDynamicCast();

  objc_opt_class();
  double v19 = [v5 dataForKey:@"progress-today"];
  v20 = BUDynamicCast();

  objc_opt_class();
  uint64_t v21 = [v5 dataForKey:@"spacer-width"];
  uint64_t v22 = BUDynamicCast();

  objc_opt_class();
  v23 = [v5 dataForKey:@"spacer-height"];
  v24 = BUDynamicCast();

  objc_opt_class();
  v25 = [v5 dataForKey:@"calendar-data"];

  v26 = BUDynamicCast();

  if (v34) {
    [(BSUIWeeklyProgressMetrics *)self setControlColor:v34];
  }
  if (v29) {
    [(BSUIWeeklyProgressMetrics *)self setProgressColor:v29];
  }
  if (v28) {
    [(BSUIWeeklyProgressMetrics *)self setPreviousDayBackgroundColor:v28];
  }
  if (v33) {
    -[BSUIWeeklyProgressMetrics setPreviousDayBorderColor:](self, "setPreviousDayBorderColor:");
  }
  if (v32) {
    -[BSUIWeeklyProgressMetrics setTextColor:](self, "setTextColor:");
  }
  if (v31) {
    -[BSUIWeeklyProgressMetrics setCompletedTextColor:](self, "setCompletedTextColor:");
  }
  if (v30) {
    -[BSUIWeeklyProgressMetrics setPreviousDayTextColor:](self, "setPreviousDayTextColor:");
  }
  if (v14) {
    [(BSUIWeeklyProgressMetrics *)self setFutureDayTextColor:v14];
  }
  if (v18) {
    [(BSUIWeeklyProgressMetrics *)self setFontSpec:v18];
  }
  if (v20)
  {
    [v20 floatValue];
    [(BSUIWeeklyProgressMetrics *)self setProgressToday:v27];
  }
  if (v22) {
    [(BSUIWeeklyProgressMetrics *)self setSpacerWidth:v22];
  }
  if (v24) {
    [(BSUIWeeklyProgressMetrics *)self setSpacerHeight:v24];
  }
  if (v26) {
    [(BSUIWeeklyProgressMetrics *)self parseCalendarData:v26];
  }
  if (v16) {
    [(BSUIWeeklyProgressMetrics *)self setBackgroundColor:v16];
  }
}

+ (id)parseCalendarData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v24 = v3;
  v4 = [v3 objectForKeyedSubscript:@"progressDays"];
  id v5 = BUDynamicCast();

  id v26 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        v11 = [v10 objectForKeyedSubscript:@"percentComplete"];
        v12 = BUDynamicCast();
        [v12 floatValue];
        double v14 = v13;

        objc_opt_class();
        v15 = [v10 objectForKeyedSubscript:@"dayLabel"];
        v16 = BUDynamicCast();

        objc_opt_class();
        v17 = [v10 objectForKeyedSubscript:@"dayType"];
        double v18 = BUDynamicCast();
        id v19 = [v18 integerValue];

        objc_opt_class();
        v20 = [v10 objectForKeyedSubscript:@"dateShortString"];
        uint64_t v21 = BUDynamicCast();

        uint64_t v22 = [[BSUIWeeklyProgressDay alloc] initWithType:v19 progress:v16 text:v21 dateShortString:v14];
        [v26 addObject:v22];
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }

  return v26;
}

- (void)parseCalendarData:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() parseCalendarData:v4];
  [(BSUIWeeklyProgressMetrics *)self setDays:v5];
  objc_opt_class();
  id v6 = [v4 objectForKeyedSubscript:@"runningStreak"];
  id v7 = BUDynamicCast();
  unsigned int v8 = [v7 BOOLValue];

  if (v8) {
    [(BSUIWeeklyProgressMetrics *)self setIsRunningStreak:1];
  }
  objc_opt_class();
  id v9 = [v4 objectForKeyedSubscript:@"dynamicProgressToday"];
  v10 = BUDynamicCast();

  [(BSUIWeeklyProgressMetrics *)self setLastVisibleProgressToday:v10];
  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:@"dailyReadingGoal"];
  v12 = BUDynamicCast();

  if (v12) {
    -[BSUIWeeklyProgressMetrics setDailyReadingGoal:](self, "setDailyReadingGoal:", [v12 integerValue]);
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = sub_28A98;
  id v19 = sub_28AA8;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_28AB0;
  v14[3] = &unk_38EEA8;
  v14[4] = &v15;
  [v5 enumerateObjectsUsingBlock:v14];
  float v13 = [(id)v16[5] dateShortString];
  [(BSUIWeeklyProgressMetrics *)self setCurrentDayShortString:v13];

  _Block_object_dispose(&v15, 8);
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v19 = NSStringFromClass(v3);
  double v18 = [(BSUIWeeklyProgressMetrics *)self days];
  unsigned int v17 = [(BSUIWeeklyProgressMetrics *)self isRunningStreak];
  [(BSUIWeeklyProgressMetrics *)self progressToday];
  uint64_t v5 = v4;
  v25 = [(BSUIWeeklyProgressMetrics *)self lastVisibleProgressToday];
  v16 = [(BSUIWeeklyProgressMetrics *)self controlColor];
  v24 = [(BSUIWeeklyProgressMetrics *)self progressColor];
  v23 = [(BSUIWeeklyProgressMetrics *)self previousDayBackgroundColor];
  uint64_t v22 = [(BSUIWeeklyProgressMetrics *)self textColor];
  uint64_t v21 = [(BSUIWeeklyProgressMetrics *)self completedTextColor];
  uint64_t v15 = [(BSUIWeeklyProgressMetrics *)self futureDayTextColor];
  double v14 = [(BSUIWeeklyProgressMetrics *)self previousDayBorderColor];
  id v6 = [(BSUIWeeklyProgressMetrics *)self previousDayTextColor];
  id v7 = [(BSUIWeeklyProgressMetrics *)self fontSpec];
  unsigned int v8 = [(BSUIWeeklyProgressMetrics *)self axValue];
  id v9 = [(BSUIWeeklyProgressMetrics *)self nightMode];
  v10 = [(BSUIWeeklyProgressMetrics *)self rightToLeft];
  v11 = [(BSUIWeeklyProgressMetrics *)self triggerName];
  v12 = [(BSUIWeeklyProgressMetrics *)self triggerDelay];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@(%p) days=%@ isRunningStreak=%d progressToday=%.1f lastVisibleProgressToday=%@ controlColor=%@ progressColor=%@ previousDayBackgroundColor=%@ textColor=%@ completedTextColor=%@ futureDayTextColor=%@ previousDayBorderColor=%@ previousDayTextColor=%@ fontSpec=%@ axValue=%@ nightMode=%@ rightToLeft=%@ triggerName:%@ triggerDelay:%@ triggerState: %ld >", v19, self, v18, v17, v5, v25, v16, v24, v23, v22, v21, v15, v14, v6, v7, v8,
    v9,
    v10,
    v11,
    v12,
  id v20 = [(BSUIWeeklyProgressMetrics *)self targetTriggerState]);

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = BUDynamicCast();

  if (v5)
  {
    id v6 = [(BSUIWeeklyProgressMetrics *)self days];
    id v7 = [v5 days];
    if ([v6 isEqualToArray:v7]
      && (unsigned int v8 = [(BSUIWeeklyProgressMetrics *)self isRunningStreak],
          v8 == [v5 isRunningStreak])
      && ([(BSUIWeeklyProgressMetrics *)self progressToday],
          double v10 = v9,
          [v5 progressToday],
          v10 == v11))
    {
      v12 = [(BSUIWeeklyProgressMetrics *)self lastVisibleProgressToday];
      float v13 = [v5 lastVisibleProgressToday];
      if (v12 == v13)
      {
        v16 = [(BSUIWeeklyProgressMetrics *)self fontSpec];
        unsigned int v17 = [v5 fontSpec];
        if ([v16 isEqual:v17])
        {
          double v18 = [(BSUIWeeklyProgressMetrics *)self axValue];
          id v19 = [v5 axValue];
          if ([v18 isEqualToNumber:v19])
          {
            id v26 = v18;
            uint64_t v20 = [(BSUIWeeklyProgressMetrics *)self nightMode];
            uint64_t v21 = [v5 nightMode];
            long long v27 = (void *)v20;
            uint64_t v22 = (void *)v20;
            v23 = (void *)v21;
            if ([v22 isEqualToNumber:v21])
            {
              v25 = [(BSUIWeeklyProgressMetrics *)self rightToLeft];
              v24 = [v5 rightToLeft];
              unsigned __int8 v14 = [v25 isEqualToNumber:v24];
            }
            else
            {
              unsigned __int8 v14 = 0;
            }

            double v18 = v26;
          }
          else
          {
            unsigned __int8 v14 = 0;
          }
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (NSArray)days
{
  return self->_days;
}

- (void)setDays:(id)a3
{
}

- (BOOL)isRunningStreak
{
  return self->_isRunningStreak;
}

- (void)setIsRunningStreak:(BOOL)a3
{
  self->_isRunningStreak = a3;
}

- (double)progressToday
{
  return self->_progressToday;
}

- (void)setProgressToday:(double)a3
{
  self->_progressToday = a3;
}

- (int64_t)dailyReadingGoal
{
  return self->_dailyReadingGoal;
}

- (void)setDailyReadingGoal:(int64_t)a3
{
  self->_dailyReadingGoal = a3;
}

- (BSUIDynamicValue)lastVisibleProgressToday
{
  return self->_lastVisibleProgressToday;
}

- (void)setLastVisibleProgressToday:(id)a3
{
}

- (NSString)currentDayShortString
{
  return self->_currentDayShortString;
}

- (void)setCurrentDayShortString:(id)a3
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

- (UIColor)previousDayBackgroundColor
{
  return self->_previousDayBackgroundColor;
}

- (void)setPreviousDayBackgroundColor:(id)a3
{
}

- (UIColor)previousDayBorderColor
{
  return self->_previousDayBorderColor;
}

- (void)setPreviousDayBorderColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)completedTextColor
{
  return self->_completedTextColor;
}

- (void)setCompletedTextColor:(id)a3
{
}

- (UIColor)previousDayTextColor
{
  return self->_previousDayTextColor;
}

- (void)setPreviousDayTextColor:(id)a3
{
}

- (UIColor)futureDayTextColor
{
  return self->_futureDayTextColor;
}

- (void)setFutureDayTextColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
}

- (NSNumber)spacerWidth
{
  return self->_spacerWidth;
}

- (void)setSpacerWidth:(id)a3
{
}

- (NSNumber)spacerHeight
{
  return self->_spacerHeight;
}

- (void)setSpacerHeight:(id)a3
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

- (void)setTargetTriggerState:(unint64_t)a3
{
  self->_targetTriggerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDelay, 0);
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_rightToLeft, 0);
  objc_storeStrong((id *)&self->_nightMode, 0);
  objc_storeStrong((id *)&self->_axValue, 0);
  objc_storeStrong((id *)&self->_spacerHeight, 0);
  objc_storeStrong((id *)&self->_spacerWidth, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_futureDayTextColor, 0);
  objc_storeStrong((id *)&self->_previousDayTextColor, 0);
  objc_storeStrong((id *)&self->_completedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_previousDayBorderColor, 0);
  objc_storeStrong((id *)&self->_previousDayBackgroundColor, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
  objc_storeStrong((id *)&self->_controlColor, 0);
  objc_storeStrong((id *)&self->_currentDayShortString, 0);
  objc_storeStrong((id *)&self->_lastVisibleProgressToday, 0);

  objc_storeStrong((id *)&self->_days, 0);
}

@end