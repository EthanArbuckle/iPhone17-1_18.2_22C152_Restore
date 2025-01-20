@interface LargeYearViewYearHeader
+ (double)headerDaySpacingForWindowSize:(CGSize)a3;
+ (double)headerYInsetForWindowSize:(CGSize)a3;
+ (double)middleHeightForWindowSize:(CGSize)a3;
- (double)_yearNumberFontSize;
- (double)heightBetweenLineAndNumber;
- (double)overlayLegendLineLength;
- (double)overlayLegendMonthBaseline;
- (double)overlayLegendMonthLineThickness;
- (double)overlayLegendRightInset;
- (double)overlayLegendSpacing;
- (double)overlayLegendYearBaseline;
- (double)overlayLegendYearLineThickness;
- (double)yearNumberKerning;
- (id)overlayLegendFont;
- (id)yearNumberFont;
@end

@implementation LargeYearViewYearHeader

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  return 13.0;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (EKUIWindowInterfaceParadigmForWindowSize() == 8) {
    return 57.0;
  }
  if (qword_100216880 != -1) {
    dispatch_once(&qword_100216880, &stru_1001D4F20);
  }
  v5 = (void *)qword_100216878;

  [v5 valueForSize:width];
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  return 0.0;
}

- (double)heightBetweenLineAndNumber
{
  return 1.0;
}

- (id)yearNumberFont
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1F9C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  if (qword_100216890 != -1) {
    dispatch_once(&qword_100216890, block);
  }
  return (id)qword_100216888;
}

- (double)_yearNumberFontSize
{
  if (EKUICurrentWindowInterfaceParadigm() == 8) {
    return 24.0;
  }
  if (qword_1002168A0 != -1) {
    dispatch_once(&qword_1002168A0, &stru_1001D4F40);
  }
  v4 = (void *)qword_100216898;
  AnchoredValueCurrentWindowWidth(self);

  [v4 valueForSize:];
  return result;
}

- (double)yearNumberKerning
{
  return 0.0;
}

- (id)overlayLegendFont
{
  if (EKUICurrentWindowInterfaceParadigm() == 8)
  {
    v3 = +[UIFont systemFontOfSize:12.0];
  }
  else
  {
    v4 = [(LargeYearViewYearHeader *)self traitCollection];
    v3 = +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:UIFontTextStyleCaption1 maximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium traitCollection:v4];
  }

  return v3;
}

- (double)overlayLegendRightInset
{
  return 64.0;
}

- (double)overlayLegendYearBaseline
{
  if (EKUICurrentWindowInterfaceParadigm() == 8) {
    return 37.0;
  }
  [(LargeYearViewYearHeader *)self overlayLegendMonthBaseline];
  double v5 = v4;
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:1 maximumValue:37.0 - v4 shouldScaleForSmallerSizes:34.0];
  return v5 + v6;
}

- (double)overlayLegendMonthBaseline
{
  return 15.0;
}

- (double)overlayLegendSpacing
{
  v2 = [(LargeYearViewYearHeader *)self traitCollection];
  int v3 = EKUIUsesLargeTextYearView();

  double result = 6.0;
  if (v3) {
    return 12.0;
  }
  return result;
}

- (double)overlayLegendLineLength
{
  v2 = [(LargeYearViewYearHeader *)self traitCollection];
  int v3 = EKUIUsesLargeTextYearView();

  double result = 12.0;
  if (v3) {
    return 24.0;
  }
  return result;
}

- (double)overlayLegendYearLineThickness
{
  v2 = [(LargeYearViewYearHeader *)self traitCollection];
  int v3 = EKUIUsesLargeTextYearView();

  double result = 2.0;
  if (v3) {
    return 4.0;
  }
  return result;
}

- (double)overlayLegendMonthLineThickness
{
  v2 = [(LargeYearViewYearHeader *)self traitCollection];
  int v3 = EKUIUsesLargeTextYearView();

  double result = 1.0;
  if (v3) {
    return 2.0;
  }
  return result;
}

@end