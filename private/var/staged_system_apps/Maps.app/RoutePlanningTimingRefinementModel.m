@interface RoutePlanningTimingRefinementModel
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (id)titleText;
- (int)buttonPressUsageAction;
- (void)_assertValidValue;
@end

@implementation RoutePlanningTimingRefinementModel

- (id)titleText
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  v3 = +[RoutePlanningTimingFormatter textForTiming:v2];

  return v3;
}

- (BOOL)shouldShowHighlighted
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  char v3 = [v2 isDepartNow] ^ 1;

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (int)buttonPressUsageAction
{
  return 3034;
}

- (void)_assertValidValue
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = +[NSString stringWithFormat:@"Wrong type"];
      int v8 = 136316162;
      v9 = "-[RoutePlanningTimingRefinementModel _assertValidValue]";
      __int16 v10 = 2080;
      v11 = "RoutePlanningTimingRefinementModel.m";
      __int16 v12 = 1024;
      int v13 = 39;
      __int16 v14 = 2080;
      v15 = "[self.value isKindOfClass:[RoutePlanningTiming class]]";
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v8, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = +[NSThread callStackSymbols];
        int v8 = 138412290;
        v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

@end