@interface NavManeverSignLayoutBase
- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewArrowMetricsForSign:(SEL)a3;
- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewJunctionArrowMetricsForSign:(SEL)a3;
- (BOOL)_shouldShowExitShieldForSign:(id)a3;
- (BOOL)_shouldShowManeuverViewForSign:(id)a3;
- (BOOL)forceHideManeuverViewForSign:(id)a3;
- (BOOL)forceHideShieldViewForSign:(id)a3;
- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4;
- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4;
- (CGSize)maneuverViewSizeForSign:(id)a3;
- (double)baselineMarginBetweenLabelsForSign:(id)a3;
- (double)maneuverViewTopMarginForSign:(id)a3;
- (double)navSignView:(id)a3 textTrailingMarginForMajorText:(BOOL)a4;
- (double)shieldViewTopMarginForSign:(id)a3;
- (double)textBottomMarginForSign:(id)a3;
- (double)textTopMarginForSign:(id)a3;
- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4;
- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4;
- (int64_t)maneuverViewPositionForSign:(id)a3;
@end

@implementation NavManeverSignLayoutBase

- (BOOL)_shouldShowExitShieldForSign:(id)a3
{
  v4 = [a3 maneuverSign];
  if ([v4 hasShieldInfo]
    && ([v4 suppressShieldView] & 1) == 0)
  {
    unsigned int v5 = ![(NavManeverSignLayoutBase *)self forceHideShieldViewForSign:v4];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_shouldShowManeuverViewForSign:(id)a3
{
  v4 = [a3 maneuverSign];
  if ([v4 hasManeuverArtwork]) {
    unsigned int v5 = ![(NavManeverSignLayoutBase *)self forceHideManeuverViewForSign:v4];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (double)navSignView:(id)a3 textTrailingMarginForMajorText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v4
    || (double v7 = 5.0, ![(NavManeverSignLayoutBase *)self _shouldShowExitShieldForSign:v6]))
  {
    v10.receiver = self;
    v10.super_class = (Class)NavManeverSignLayoutBase;
    [(NavSignLayoutBase *)&v10 navSignView:v6 textTrailingMarginForMajorText:v4];
    double v7 = v8;
  }

  return v7;
}

- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4
{
  return !-[NavManeverSignLayoutBase _shouldShowManeuverViewForSign:](self, "_shouldShowManeuverViewForSign:", a3, a4);
}

- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4
{
  if (a4) {
    return ![(NavManeverSignLayoutBase *)self _shouldShowExitShieldForSign:a3];
  }
  v5.receiver = self;
  v5.super_class = (Class)NavManeverSignLayoutBase;
  return -[NavSignLayoutBase navSignView:shouldAlignToTrailingForMajorText:](&v5, "navSignView:shouldAlignToTrailingForMajorText:", a3);
}

- (double)textTopMarginForSign:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 maneuverSign];
  id v6 = (char *)[v5 maneuverSignType];

  if ((unint64_t)(v6 - 1) > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)NavManeverSignLayoutBase;
    [(NavSignLayoutBase *)&v11 textTopMarginForSign:v4];
    double v8 = v9;
  }
  else
  {
    unsigned int v7 = [v4 hasOnlySingleLineText];

    if (v7) {
      return 50.0;
    }
    else {
      return 41.0;
    }
  }
  return v8;
}

- (double)textBottomMarginForSign:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 maneuverSign];
  id v6 = (char *)[v5 maneuverSignType];

  if ((unint64_t)(v6 - 1) > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)NavManeverSignLayoutBase;
    [(NavSignLayoutBase *)&v11 textBottomMarginForSign:v4];
    double v8 = v9;
  }
  else
  {
    unsigned int v7 = [v4 hasOnlySingleLineText];

    if (v7) {
      return 30.0;
    }
    else {
      return 23.0;
    }
  }
  return v8;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 maneuverSign];
  id v6 = (char *)[v5 maneuverSignType];

  if ((unint64_t)(v6 - 1) >= 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)NavManeverSignLayoutBase;
    [(NavSignLayoutBase *)&v10 baselineMarginBetweenLabelsForSign:v4];
    double v7 = v8;
  }
  else
  {
    double v7 = 32.0;
  }

  return v7;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 maneuverSign];
  double v8 = (char *)[v7 maneuverSignType];

  if ((unint64_t)(v8 - 1) > 1)
  {
    v13.receiver = self;
    v13.super_class = (Class)NavManeverSignLayoutBase;
    uint64_t v10 = [(NavSignLayoutBase *)&v13 navSignView:v6 preferredFontForMajorText:v4];
  }
  else
  {
    double v9 = &UIFontWeightMedium;
    if (v4) {
      double v9 = &UIFontWeightHeavy;
    }
    uint64_t v10 = +[UIFont systemFontOfSize:27.0 weight:*v9];
  }
  objc_super v11 = (void *)v10;

  return v11;
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 maneuverSign];
  double v8 = (char *)[v7 maneuverSignType];

  if ((unint64_t)(v8 - 1) > 1)
  {
    v14.receiver = self;
    v14.super_class = (Class)NavManeverSignLayoutBase;
    uint64_t v11 = [(NavSignLayoutBase *)&v14 navSignView:v6 alternateFontForMajorText:v4];
  }
  else
  {
    if (v4)
    {
      double v9 = UIFontWeightHeavy;
      double v10 = 27.0;
    }
    else
    {
      double v9 = UIFontWeightMedium;
      double v10 = 24.0;
    }
    uint64_t v11 = +[UIFont systemFontOfSize:v10 weight:v9];
  }
  v12 = (void *)v11;

  return v12;
}

- (BOOL)forceHideManeuverViewForSign:(id)a3
{
  return 0;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 0;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewArrowMetricsForSign:(SEL)a3
{
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 0, 0, 58.0, 58.0);
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)maneuverViewJunctionArrowMetricsForSign:(SEL)a3
{
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return +[SignStyle junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 0, 0, 58.0, 58.0);
}

- (CGSize)maneuverViewSizeForSign:(id)a3
{
  double v3 = 48.0;
  double v4 = 58.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  return 22.5;
}

- (int64_t)maneuverViewPositionForSign:(id)a3
{
  double v3 = [a3 minorLabel];
  BOOL v4 = (unint64_t)[v3 lineCount] > 2;

  return 2 * v4;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  return 22.5;
}

@end