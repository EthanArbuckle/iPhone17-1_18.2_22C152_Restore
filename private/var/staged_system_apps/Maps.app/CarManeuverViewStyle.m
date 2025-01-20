@interface CarManeuverViewStyle
+ (CarManeuverViewStyle)styleWithVariant:(unint64_t)a3 destination:(unint64_t)a4 layoutType:(unint64_t)a5;
- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics;
- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics;
- (BOOL)_isDisplayedInWidget;
- (BOOL)canHaveLaneGuidance;
- (BOOL)displaysShield;
- (BOOL)hasLaneGuidance;
- (BOOL)hasShield;
- (BOOL)isSecondary;
- (BOOL)secondarySignVisible;
- (BOOL)shouldScaleInstructionsPreferredFont;
- (CGSize)arrowReferenceSize;
- (CarManeuverViewStyle)initWithVariant:(unint64_t)a3 destination:(unint64_t)a4 layoutType:(unint64_t)a5;
- (UIColor)arrowMainColor;
- (UIColor)distanceColor;
- (UIColor)instructionsColor;
- (UIColor)invalidArrowColor;
- (UIFont)distanceFont;
- (UIFont)instructionsAlternateFont;
- (UIFont)instructionsPreferredFont;
- (double)instructionsAlternateFontLineSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (int)blurMode;
- (int64_t)alignmentStyle;
- (int64_t)instructionsMaxNumberOfLinesWithPreferredFont;
- (int64_t)instructionsMaxNumberOfTotalLines;
- (int64_t)labelLineBreakMode;
- (unint64_t)compressionStage;
- (unint64_t)destination;
- (unint64_t)layoutType;
- (unint64_t)variant;
- (unsigned)desiredFraming;
- (void)setAlignmentStyle:(int64_t)a3;
- (void)setBlurMode:(int)a3;
- (void)setCompressionStage:(unint64_t)a3;
- (void)setHasLaneGuidance:(BOOL)a3;
- (void)setHasShield:(BOOL)a3;
- (void)setLayoutType:(unint64_t)a3;
- (void)setSecondarySignVisible:(BOOL)a3;
@end

@implementation CarManeuverViewStyle

- (CarManeuverViewStyle)initWithVariant:(unint64_t)a3 destination:(unint64_t)a4 layoutType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CarManeuverViewStyle;
  result = [(CarManeuverViewStyle *)&v9 init];
  if (result)
  {
    result->_layoutType = a5;
    result->_destination = a4;
    result->_variant = a3;
    result->_blurMode = 0;
  }
  return result;
}

+ (CarManeuverViewStyle)styleWithVariant:(unint64_t)a3 destination:(unint64_t)a4 layoutType:(unint64_t)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithVariant:a3 destination:a4 layoutType:a5];

  return (CarManeuverViewStyle *)v5;
}

- (BOOL)displaysShield
{
  return self->_variant == 0;
}

- (BOOL)_isDisplayedInWidget
{
  return self->_destination == 1;
}

- (UIFont)distanceFont
{
  if ((id)[(CarManeuverViewStyle *)self layoutType] == (id)2)
  {
    if ([(CarManeuverViewStyle *)self hasLaneGuidance]
      || [(CarManeuverViewStyle *)self hasShield])
    {
      double v3 = UIFontWeightBold;
      double v4 = 13.0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ((id)[(CarManeuverViewStyle *)self variant] == (id)1)
  {
    id v5 = &UIFontWeightBold;
LABEL_11:
    double v3 = *v5;
    double v4 = 17.0;
    goto LABEL_12;
  }
  if ([(CarManeuverViewStyle *)self isSecondary])
  {
    double v3 = UIFontWeightHeavy;
    double v4 = 12.0;
    goto LABEL_12;
  }
  if ([(CarManeuverViewStyle *)self hasLaneGuidance])
  {
LABEL_10:
    id v5 = &UIFontWeightHeavy;
    goto LABEL_11;
  }
  unsigned int v8 = [(CarManeuverViewStyle *)self hasShield];
  unint64_t v9 = [(CarManeuverViewStyle *)self layoutType];
  double v3 = UIFontWeightHeavy;
  if (v8) {
    double v4 = 17.0;
  }
  else {
    double v4 = 20.0;
  }
  if (v9 == 1) {
    double v4 = 16.0;
  }
LABEL_12:
  v6 = +[UIFont monospacedDigitSystemFontOfSize:v4 weight:v3];

  return (UIFont *)v6;
}

- (UIColor)distanceColor
{
  char v2 = [(CarManeuverViewStyle *)self _isDisplayedInWidget];

  return (UIColor *)sub_100D89C4C(v2);
}

- (UIColor)instructionsColor
{
  unint64_t v3 = [(CarManeuverViewStyle *)self variant];
  char v4 = [(CarManeuverViewStyle *)self _isDisplayedInWidget];
  if (v3 == 2) {
    sub_100D89C4C(v4);
  }
  else {
  id v5 = sub_100D89C94(v4);
  }

  return (UIColor *)v5;
}

- (UIColor)arrowMainColor
{
  char v2 = [(CarManeuverViewStyle *)self _isDisplayedInWidget];

  return (UIColor *)sub_100D89C4C(v2);
}

- (UIColor)invalidArrowColor
{
  if ([(CarManeuverViewStyle *)self _isDisplayedInWidget]) {
    +[UIColor carPlayDashboardJunctionColor];
  }
  else {
  char v2 = +[UIColor carPlayJunctionColor];
  }

  return (UIColor *)v2;
}

- (UIFont)instructionsPreferredFont
{
  unint64_t v3 = [(CarManeuverViewStyle *)self layoutType];
  double v4 = 13.0;
  if (v3 != 2)
  {
    unsigned int v5 = [(CarManeuverViewStyle *)self isSecondary];
    double v4 = 16.0;
    if (v5) {
      double v4 = 12.0;
    }
  }
  v6 = +[UIFont systemFontOfSize:v4 weight:UIFontWeightMedium];

  return (UIFont *)v6;
}

- (UIFont)instructionsAlternateFont
{
  unint64_t v3 = [(CarManeuverViewStyle *)self layoutType];
  double v4 = 12.0;
  if (v3 != 2)
  {
    unsigned int v5 = [(CarManeuverViewStyle *)self isSecondary];
    double v4 = 15.0;
    if (v5) {
      double v4 = 12.0;
    }
  }
  v6 = +[UIFont systemFontOfSize:v4 weight:UIFontWeightMedium];

  return (UIFont *)v6;
}

- (double)instructionsAlternateFontLineSpacing
{
  unsigned int v2 = [(CarManeuverViewStyle *)self isSecondary];
  double result = 16.0;
  if (v2) {
    return 12.0;
  }
  return result;
}

- (int64_t)instructionsMaxNumberOfLinesWithPreferredFont
{
  if ([(CarManeuverViewStyle *)self isSecondary]) {
    return 1;
  }
  if ((id)[(CarManeuverViewStyle *)self destination] != (id)2) {
    return 2;
  }
  if ([(CarManeuverViewStyle *)self alignmentStyle]) {
    return 2;
  }
  return 1;
}

- (int64_t)instructionsMaxNumberOfTotalLines
{
  if ([(CarManeuverViewStyle *)self isSecondary])
  {
    BOOL v3 = (id)[(CarManeuverViewStyle *)self compressionStage] == (id)1;
    goto LABEL_7;
  }
  if ((id)[(CarManeuverViewStyle *)self layoutType] == (id)2) {
    return 1;
  }
  if ((id)[(CarManeuverViewStyle *)self destination] == (id)2)
  {
    BOOL v3 = [(CarManeuverViewStyle *)self alignmentStyle] == 0;
LABEL_7:
    if (v3) {
      return 1;
    }
    else {
      return 2;
    }
  }
  unint64_t v5 = [(CarManeuverViewStyle *)self compressionStage];
  if (v5 - 1 > 5) {
    return 5;
  }
  else {
    return qword_100F738A8[v5 - 1];
  }
}

- (BOOL)shouldScaleInstructionsPreferredFont
{
  return (id)[(CarManeuverViewStyle *)self instructionsMaxNumberOfTotalLines] == (id)1
      && (id)[(CarManeuverViewStyle *)self destination] != (id)2;
}

- (int64_t)labelLineBreakMode
{
  if ([(CarManeuverViewStyle *)self isSecondary]) {
    return 0;
  }
  else {
    return 4;
  }
}

- (BOOL)isSecondary
{
  return self->_variant == 2;
}

- (BOOL)canHaveLaneGuidance
{
  return self->_variant == 0;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  BOOL v4 = self->_variant == 2;
  [(CarManeuverViewStyle *)self arrowReferenceSize];
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;

  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", v4, 0);
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  BOOL v4 = self->_variant == 2;
  [(CarManeuverViewStyle *)self arrowReferenceSize];
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;

  return +[SignStyle junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "junctionArrowMetricsForStyle:scaledToMatchReferenceSize:forView:", v4, 0);
}

- (CGSize)arrowReferenceSize
{
  unint64_t variant = self->_variant;
  double v3 = 0.0;
  if (variant <= 2) {
    double v3 = dbl_100F738D8[variant];
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (unsigned)desiredFraming
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [objc_opt_class() styleWithVariant:[self variant] destination:[self destination] layoutType:[self layoutType]];
  [v4 setHasLaneGuidance:[self hasLaneGuidance]];
  [v4 setHasShield:[self hasShield]];
  [v4 setSecondarySignVisible:[self secondarySignVisible]];
  [v4 setCompressionStage:[self compressionStage]];
  return v4;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(unint64_t)a3
{
  self->_layoutType = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (int64_t)alignmentStyle
{
  return self->_alignmentStyle;
}

- (void)setAlignmentStyle:(int64_t)a3
{
  self->_alignmentStyle = a3;
}

- (BOOL)hasLaneGuidance
{
  return self->_hasLaneGuidance;
}

- (void)setHasLaneGuidance:(BOOL)a3
{
  self->_hasLaneGuidance = a3;
}

- (BOOL)hasShield
{
  return self->_hasShield;
}

- (void)setHasShield:(BOOL)a3
{
  self->_hasShield = a3;
}

- (BOOL)secondarySignVisible
{
  return self->_secondarySignVisible;
}

- (void)setSecondarySignVisible:(BOOL)a3
{
  self->_secondarySignVisible = a3;
}

- (int)blurMode
{
  return self->_blurMode;
}

- (void)setBlurMode:(int)a3
{
  self->_blurMode = a3;
}

- (unint64_t)compressionStage
{
  return self->_compressionStage;
}

- (void)setCompressionStage:(unint64_t)a3
{
  self->_compressionStage = a3;
}

@end