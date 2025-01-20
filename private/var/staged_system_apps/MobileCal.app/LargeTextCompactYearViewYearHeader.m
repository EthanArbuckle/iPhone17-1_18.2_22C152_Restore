@interface LargeTextCompactYearViewYearHeader
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
- (id)overlayLegendFont;
- (id)yearNumberFont;
@end

@implementation LargeTextCompactYearViewYearHeader

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_100216A70 != -1) {
    dispatch_once(&qword_100216A70, &stru_1001D5BE8);
  }
  v4 = (void *)qword_100216A68;

  [v4 valueForSize:width];
  return result;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_100216A80 != -1) {
    dispatch_once(&qword_100216A80, &stru_1001D5C08);
  }
  v4 = (void *)qword_100216A78;

  [v4 valueForSize:width];
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  double width = a3.width;
  if (qword_100216A90 != -1) {
    dispatch_once(&qword_100216A90, &stru_1001D5C28);
  }
  v4 = (void *)qword_100216A88;

  [v4 valueForSize:width];
  return result;
}

- (double)heightBetweenLineAndNumber
{
  if (qword_100216AA0 != -1) {
    dispatch_once(&qword_100216AA0, &stru_1001D5C48);
  }
  v3 = (void *)qword_100216A98;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (id)yearNumberFont
{
  if (qword_100216AB0 != -1) {
    dispatch_once(&qword_100216AB0, &stru_1001D5C68);
  }
  v3 = (void *)qword_100216AA8;
  AnchoredValueCurrentWindowWidth(self);
  [v3 valueForSize:];
  v5 = (void *)qword_100216AB8;
  if (!qword_100216AB8) {
    goto LABEL_7;
  }
  double v6 = v4 - *(double *)&qword_100215BD0;
  if (v4 - *(double *)&qword_100215BD0 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 0.0001)
  {
LABEL_7:
    qword_100215BD0 = *(void *)&v4;
    uint64_t v7 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
    v8 = (void *)qword_100216AB8;
    qword_100216AB8 = v7;

    v5 = (void *)qword_100216AB8;
  }

  return v5;
}

- (id)overlayLegendFont
{
  if (qword_100216AC8 != -1) {
    dispatch_once(&qword_100216AC8, &stru_1001D5C88);
  }
  v3 = (void *)qword_100216AC0;
  AnchoredValueCurrentWindowWidth(self);
  [v3 valueForSize:];

  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (double)overlayLegendRightInset
{
  return 16.0;
}

- (double)overlayLegendYearBaseline
{
  [(LargeTextCompactYearViewYearHeader *)self overlayLegendMonthBaseline];
  v3 = [(LargeTextCompactYearViewYearHeader *)self overlayLegendFont];
  [v3 _bodyLeading];
  CalRoundToScreenScale();
  double v5 = v4;

  return v5;
}

- (double)overlayLegendMonthBaseline
{
  if (qword_100216AD8 != -1) {
    dispatch_once(&qword_100216AD8, &stru_1001D5CA8);
  }
  v3 = (void *)qword_100216AD0;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)overlayLegendSpacing
{
  return 4.0;
}

- (double)overlayLegendLineLength
{
  if (qword_100216AE8 != -1) {
    dispatch_once(&qword_100216AE8, &stru_1001D5CC8);
  }
  v3 = (void *)qword_100216AE0;
  AnchoredValueCurrentWindowWidth(self);

  [v3 valueForSize:];
  return result;
}

- (double)overlayLegendYearLineThickness
{
  return 3.0;
}

- (double)overlayLegendMonthLineThickness
{
  return 1.0;
}

@end