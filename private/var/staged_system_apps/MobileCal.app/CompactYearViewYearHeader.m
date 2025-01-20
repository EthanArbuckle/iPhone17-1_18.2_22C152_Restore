@interface CompactYearViewYearHeader
+ (double)headerDaySpacingForWindowSize:(CGSize)a3;
+ (double)headerYInsetForWindowSize:(CGSize)a3;
+ (double)middleHeightForWindowSize:(CGSize)a3;
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

@implementation CompactYearViewYearHeader

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_100216828 != -1) {
    dispatch_once(&qword_100216828, &stru_1001D4CD0);
  }
  double v4 = 4.5;
  if (EKUIWindowSizeParadigmForWindowSize() != 0x20000)
  {
    [(id)qword_100216820 valueForSize:width];
    double v4 = v5;
    uint64_t v6 = EKUIWindowSizeParadigmForWindowSize();
    if (v6 > 0xFFFFFF)
    {
      if (v6 != 0x1000000 && v6 != 0x10000000 && v6 != 0x4000000) {
        return v4;
      }
LABEL_11:
      CalOnePixelInPoints();
      return v4 + v7;
    }
    if (v6 == 0x40000 || v6 == 0x400000) {
      goto LABEL_11;
    }
  }
  return v4;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_100216838 != -1) {
    dispatch_once(&qword_100216838, &stru_1001D4CF0);
  }
  double v4 = (void *)qword_100216830;

  [v4 valueForSize:width];
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_100216848 != -1) {
    dispatch_once(&qword_100216848, &stru_1001D4D10);
  }
  if (EKUIWindowSizeParadigmForWindowSize() == 0x20000) {
    return 11.0;
  }
  double v5 = (void *)qword_100216840;

  [v5 valueForSize:width];
  return result;
}

- (double)heightBetweenLineAndNumber
{
  if (qword_100216858 != -1) {
    dispatch_once(&qword_100216858, &stru_1001D4D30);
  }
  if (EKUICurrentWindowSizeParadigmForViewHierarchy() == 0x20000) {
    return 9.5;
  }
  double v4 = (void *)qword_100216850;
  AnchoredValueCurrentWindowWidth(self);

  [v4 valueForSize:];
  return result;
}

- (id)yearNumberFont
{
  v2 = (void *)qword_100216860;
  if (!qword_100216860)
  {
    v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle0 addingSymbolicTraits:32770 options:0];
    uint64_t v4 = +[UIFont fontWithDescriptor:v3 size:0.0];
    double v5 = (void *)qword_100216860;
    qword_100216860 = v4;

    v2 = (void *)qword_100216860;
  }

  return v2;
}

- (double)yearNumberKerning
{
  return -0.5;
}

- (id)overlayLegendFont
{
  return +[UIFont systemFontOfSize:10.0];
}

- (double)overlayLegendRightInset
{
  return 16.0;
}

- (double)overlayLegendYearBaseline
{
  return 22.0;
}

- (double)overlayLegendMonthBaseline
{
  return 8.0;
}

- (double)overlayLegendSpacing
{
  return 4.0;
}

- (double)overlayLegendLineLength
{
  return 8.0;
}

- (double)overlayLegendYearLineThickness
{
  return 1.5;
}

- (double)overlayLegendMonthLineThickness
{
  return 0.5;
}

@end