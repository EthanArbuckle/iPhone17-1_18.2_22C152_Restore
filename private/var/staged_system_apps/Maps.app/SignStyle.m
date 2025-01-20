@interface SignStyle
+ ($84D9B426F26CE1F36C5948DD9DEACC84)_defaultArrowMetricsForStyle:(SEL)a3;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)_defaultJunctionArrowMetricsForStyle:(SEL)a3;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)_metricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5 baseMetrics:(double)a6;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)_scaledMetricsForStyle:(SEL)a3 baseMetrics:(unsigned int)a4;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 forView:(CGSize)a5;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 forView:(CGSize)a5;
+ (id)sharedSignStyle;
- (BOOL)isDimmed;
- (UIColor)foregroundColor;
- (UIImage)squareSignImage;
- (id)dimmedForegroundColor;
@end

@implementation SignStyle

+ (id)sharedSignStyle
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10082EDB4;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160FB80 != -1) {
    dispatch_once(&qword_10160FB80, block);
  }
  v2 = (void *)qword_10160FB78;

  return v2;
}

- (UIImage)squareSignImage
{
  return 0;
}

- (id)dimmedForegroundColor
{
  return +[UIColor colorWithRed:0.23137255 green:0.254901975 blue:0.278431386 alpha:1.0];
}

- (UIColor)foregroundColor
{
  if ([(SignStyle *)self isDimmed]) {
    [(SignStyle *)self dimmedForegroundColor];
  }
  else {
  v3 = +[UIColor colorWithWhite:0.200000003 alpha:1.0];
  }

  return (UIColor *)v3;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 forView:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v8 = *(void *)&a4;
  id v17 = a6;
  v10 = [v17 window];
  v11 = [v10 screen];
  if (v11)
  {
    v12 = [v17 window];
    v13 = [v12 screen];
    [v13 scale];
    double v15 = v14;
  }
  else
  {
    double v15 = 1.0;
  }

  [a2 arrowMetricsForStyle:v8 scaledToMatchReferenceSize:width contentScale:height];

  return result;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 forView:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v8 = *(void *)&a4;
  id v17 = a6;
  v10 = [v17 window];
  v11 = [v10 screen];
  if (v11)
  {
    v12 = [v17 window];
    v13 = [v12 screen];
    [v13 scale];
    double v15 = v14;
  }
  else
  {
    double v15 = 1.0;
  }

  [a2 junctionArrowMetricsForStyle:v8 scaledToMatchReferenceSize:width contentScale:height];

  return result;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v9 = *(void *)&a4;
  [a2 _defaultJunctionArrowMetricsForStyle:];
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)[a2 _metricsForStyle:v9 scaledToMatchReferenceSize:&v12 contentScale:width height:height baseMetrics:a6];
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v9 = *(void *)&a4;
  [a2 _defaultArrowMetricsForStyle:];
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)[a2 _metricsForStyle:v9 scaledToMatchReferenceSize:&v12 contentScale:width height:height baseMetrics:a6];
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_metricsForStyle:(SEL)a3 scaledToMatchReferenceSize:(unsigned int)a4 contentScale:(CGSize)a5 baseMetrics:(double)a6
{
  memcpy(v8, a7, sizeof(v8));
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)MKGuidanceManeuverArrowMetricsApplyScaleForContent();
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_defaultArrowMetricsForStyle:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  MKDefaultGuidanceManeuverMetrics();
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)[a2 _scaledMetricsForStyle:v4 baseMetrics:&v7];
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_defaultJunctionArrowMetricsForStyle:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  MKDefaultJunctionManeuverMetrics();
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)[a2 _scaledMetricsForStyle:v4 baseMetrics:&v7];
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)_scaledMetricsForStyle:(SEL)a3 baseMetrics:(unsigned int)a4
{
  if (a4 == 1)
  {
    memcpy(v5, a5, sizeof(v5));
    return ($84D9B426F26CE1F36C5948DD9DEACC84 *)MKGuidanceManeuverArrowMetricsApplyScale();
  }
  else if (!a4)
  {
    return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, a5, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
  }
  return result;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

@end