@interface _UILegibilitySettingsProvider
+ (int64_t)styleForContentColor:(id)a3;
+ (int64_t)styleForContentColor:(id)a3 contrast:(double)a4;
- (BOOL)accumulateChangesToContentColor:(id)a3;
- (BOOL)accumulateChangesToContentColor:(id)a3 contrast:(double)a4;
- (BOOL)accumulatorIsPrimed;
- (BOOL)hasContrast;
- (UIColor)contentColor;
- (double)accumulatedBrightness;
- (double)accumulatedContrast;
- (double)accumulatedLuminance;
- (double)accumulatedSaturation;
- (double)mostRecentBrightness;
- (double)mostRecentContrast;
- (double)mostRecentLuminance;
- (double)mostRecentSaturation;
- (double)nextChangeBarrier;
- (id)settings;
- (int64_t)currentStyle;
- (void)clearContentColorAccumulator;
- (void)dealloc;
- (void)setAccumulatedBrightness:(double)a3;
- (void)setAccumulatedContrast:(double)a3;
- (void)setAccumulatedLuminance:(double)a3;
- (void)setAccumulatedSaturation:(double)a3;
- (void)setAccumulatorIsPrimed:(BOOL)a3;
- (void)setContentColor:(id)a3;
- (void)setCurrentStyle:(int64_t)a3;
- (void)setHasContrast:(BOOL)a3;
- (void)setMostRecentBrightness:(double)a3;
- (void)setMostRecentContrast:(double)a3;
- (void)setMostRecentLuminance:(double)a3;
- (void)setMostRecentSaturation:(double)a3;
- (void)setNextChangeBarrier:(double)a3;
@end

@implementation _UILegibilitySettingsProvider

- (id)settings
{
  v2 = [[_UILegibilitySettings alloc] initWithStyle:[(_UILegibilitySettingsProvider *)self currentStyle] contentColor:[(_UILegibilitySettingsProvider *)self contentColor]];
  return v2;
}

- (int64_t)currentStyle
{
  return self->_currentStyle;
}

- (UIColor)contentColor
{
  return self->_contentColor;
}

- (void)clearContentColorAccumulator
{
  [(_UILegibilitySettingsProvider *)self setAccumulatorIsPrimed:0];
  [(_UILegibilitySettingsProvider *)self setAccumulatedBrightness:0.0];
  [(_UILegibilitySettingsProvider *)self setAccumulatedLuminance:0.0];
  [(_UILegibilitySettingsProvider *)self setAccumulatedSaturation:0.0];
  [(_UILegibilitySettingsProvider *)self setAccumulatedContrast:0.0];
  [(_UILegibilitySettingsProvider *)self setHasContrast:0];
  [(_UILegibilitySettingsProvider *)self setContentColor:0];
  [(_UILegibilitySettingsProvider *)self setNextChangeBarrier:0.0];
}

- (void)setAccumulatorIsPrimed:(BOOL)a3
{
  self->_accumulatorIsPrimed = a3;
}

- (BOOL)accumulateChangesToContentColor:(id)a3 contrast:(double)a4
{
  -[_UILegibilitySettingsProvider setContentColor:](self, "setContentColor:");
  if (CGColorGetNumberOfComponents((CGColorRef)[a3 CGColor]) == 2)
  {
    double v46 = 0.0;
    int v7 = [a3 getWhite:&v46 alpha:0];
    double v8 = 0.0;
    if (v7) {
      double v9 = v46;
    }
    else {
      double v9 = 0.0;
    }
    double v10 = v9;
  }
  else
  {
    double v45 = 0.0;
    double v46 = 0.0;
    double v44 = 0.0;
    double v10 = 0.0;
    if ([a3 getHue:&v46 saturation:&v45 brightness:&v44 alpha:0])
    {
      double v9 = v44;
      double v8 = v45;
      double v11 = v46;
      BOOL v12 = v45 > 0.00000011920929 || v46 > 0.00000011920929;
      int v7 = v44 > 0.00000011920929 || v12;
    }
    else
    {
      int v7 = 0;
      double v9 = 0.0;
      double v8 = 0.0;
    }
    double v42 = 0.0;
    double v43 = 0.0;
    double v41 = 0.0;
    if (objc_msgSend(a3, "getRed:green:blue:alpha:", &v43, &v42, &v41, 0, v11))
    {
      double v10 = v43 * 0.2126 + v42 * 0.7152 + v41 * 0.0722;
      BOOL v13 = v43 > 0.00000011920929;
      if (v42 > 0.00000011920929) {
        BOOL v13 = 1;
      }
      if (v41 > 0.00000011920929) {
        BOOL v13 = 1;
      }
      v7 |= v13;
    }
  }
  [(_UILegibilitySettingsProvider *)self setMostRecentBrightness:v9];
  [(_UILegibilitySettingsProvider *)self setMostRecentContrast:a4];
  [(_UILegibilitySettingsProvider *)self setMostRecentLuminance:v10];
  [(_UILegibilitySettingsProvider *)self setMostRecentSaturation:v8];
  double v14 = CACurrentMediaTime();
  double v15 = -1.0;
  if (a4 == -1.0 || (v16 = [(_UILegibilitySettingsProvider *)self hasContrast], double v15 = a4, !v16)) {
    [(_UILegibilitySettingsProvider *)self setAccumulatedContrast:v15];
  }
  double v17 = -1.0;
  -[_UILegibilitySettingsProvider setHasContrast:](self, "setHasContrast:", a4 != -1.0, v15);
  if ([(_UILegibilitySettingsProvider *)self accumulatorIsPrimed])
  {
    [(_UILegibilitySettingsProvider *)self accumulatedBrightness];
    [(_UILegibilitySettingsProvider *)self setAccumulatedBrightness:v9 * 0.4 + v18 * 0.6];
    if ([(_UILegibilitySettingsProvider *)self hasContrast])
    {
      [(_UILegibilitySettingsProvider *)self accumulatedContrast];
      double v17 = a4 * 0.4 + v19 * 0.6;
    }
    [(_UILegibilitySettingsProvider *)self setAccumulatedContrast:v17];
    [(_UILegibilitySettingsProvider *)self accumulatedLuminance];
    [(_UILegibilitySettingsProvider *)self setAccumulatedLuminance:v10 * 0.4 + v20 * 0.6];
    [(_UILegibilitySettingsProvider *)self accumulatedSaturation];
    [(_UILegibilitySettingsProvider *)self setAccumulatedSaturation:v8 * 0.4 + v21 * 0.6];
    [(_UILegibilitySettingsProvider *)self accumulatedBrightness];
    double v23 = v22;
    [(_UILegibilitySettingsProvider *)self accumulatedContrast];
    double v25 = v24;
    [(_UILegibilitySettingsProvider *)self accumulatedLuminance];
    double v27 = v26;
    [(_UILegibilitySettingsProvider *)self accumulatedSaturation];
    BOOL v29 = v25 != -1.0;
    if (v25 >= 0.09) {
      BOOL v29 = 0;
    }
    if (v23 <= 0.8) {
      BOOL v29 = 0;
    }
    uint64_t v30 = 2;
    if (v27 <= 0.86 && !v29)
    {
      if (v28 >= 0.1 || v23 + 0.1 - v28 + 0.1 - v28 <= 0.92) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = 2;
      }
    }
    if ([(_UILegibilitySettingsProvider *)self currentStyle] == v30) {
      return 0;
    }
    [(_UILegibilitySettingsProvider *)self nextChangeBarrier];
    if (v14 - v39 <= 0.0) {
      return 0;
    }
  }
  else
  {
    [(_UILegibilitySettingsProvider *)self setAccumulatedBrightness:v9];
    [(_UILegibilitySettingsProvider *)self setAccumulatedLuminance:v10];
    [(_UILegibilitySettingsProvider *)self setAccumulatedSaturation:v8];
    if (v7) {
      [(_UILegibilitySettingsProvider *)self setAccumulatorIsPrimed:1];
    }
    [(_UILegibilitySettingsProvider *)self accumulatedBrightness];
    double v32 = v31;
    [(_UILegibilitySettingsProvider *)self accumulatedContrast];
    double v34 = v33;
    [(_UILegibilitySettingsProvider *)self accumulatedLuminance];
    double v36 = v35;
    [(_UILegibilitySettingsProvider *)self accumulatedSaturation];
    BOOL v38 = v34 != -1.0;
    if (v34 >= 0.09) {
      BOOL v38 = 0;
    }
    if (v32 <= 0.8) {
      BOOL v38 = 0;
    }
    uint64_t v30 = 2;
    if (v36 <= 0.86 && !v38)
    {
      if (v37 >= 0.1 || v32 + 0.1 - v37 + 0.1 - v37 <= 0.92) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = 2;
      }
    }
  }
  [(_UILegibilitySettingsProvider *)self setCurrentStyle:v30];
  [(_UILegibilitySettingsProvider *)self setNextChangeBarrier:v14 + 0.75];
  return 1;
}

- (void)setNextChangeBarrier:(double)a3
{
  self->_nextChangeBarrier = a3;
}

- (void)setHasContrast:(BOOL)a3
{
  self->_hasContrast = a3;
}

- (void)setContentColor:(id)a3
{
}

- (void)setAccumulatedSaturation:(double)a3
{
  self->_accumulatedSaturation = a3;
}

- (void)setAccumulatedLuminance:(double)a3
{
  self->_accumulatedLuminance = a3;
}

- (void)setAccumulatedContrast:(double)a3
{
  self->_accumulatedContrast = a3;
}

- (void)setAccumulatedBrightness:(double)a3
{
  self->_accumulatedBrightness = a3;
}

- (void)setMostRecentSaturation:(double)a3
{
  self->_mostRecentSaturation = a3;
}

- (void)setMostRecentLuminance:(double)a3
{
  self->_mostRecentLuminance = a3;
}

- (void)setMostRecentContrast:(double)a3
{
  self->_mostRecentContrast = a3;
}

- (void)setMostRecentBrightness:(double)a3
{
  self->_mostRecentBrightness = a3;
}

- (void)setCurrentStyle:(int64_t)a3
{
  self->_currentStyle = a3;
}

- (BOOL)accumulatorIsPrimed
{
  return self->_accumulatorIsPrimed;
}

- (double)accumulatedSaturation
{
  return self->_accumulatedSaturation;
}

- (double)accumulatedLuminance
{
  return self->_accumulatedLuminance;
}

- (double)accumulatedContrast
{
  return self->_accumulatedContrast;
}

- (double)accumulatedBrightness
{
  return self->_accumulatedBrightness;
}

+ (int64_t)styleForContentColor:(id)a3
{
  return [a1 styleForContentColor:a3 contrast:-1.0];
}

+ (int64_t)styleForContentColor:(id)a3 contrast:(double)a4
{
  if (_MergedGlobals_10_0 != -1) {
    dispatch_once(&_MergedGlobals_10_0, &__block_literal_global_285);
  }
  [(id)qword_1EB25A0A0 clearContentColorAccumulator];
  [(id)qword_1EB25A0A0 accumulateChangesToContentColor:a3 contrast:a4];
  [(id)qword_1EB25A0A0 accumulatedBrightness];
  double v7 = v6;
  [(id)qword_1EB25A0A0 accumulatedLuminance];
  double v9 = v8;
  [(id)qword_1EB25A0A0 accumulatedSaturation];
  BOOL v12 = v7 <= 0.8 || a4 >= 0.09 || a4 == -1.0;
  int64_t result = 2;
  if (v12 && v9 <= 0.86)
  {
    if (v10 >= 0.1 || v7 + 0.1 - v10 + 0.1 - v10 <= 0.92) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

- (void)dealloc
{
  self->_contentColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilitySettingsProvider;
  [(_UILegibilitySettingsProvider *)&v3 dealloc];
}

- (BOOL)accumulateChangesToContentColor:(id)a3
{
  return [(_UILegibilitySettingsProvider *)self accumulateChangesToContentColor:a3 contrast:-1.0];
}

- (double)mostRecentSaturation
{
  return self->_mostRecentSaturation;
}

- (double)mostRecentBrightness
{
  return self->_mostRecentBrightness;
}

- (double)mostRecentContrast
{
  return self->_mostRecentContrast;
}

- (double)mostRecentLuminance
{
  return self->_mostRecentLuminance;
}

- (BOOL)hasContrast
{
  return self->_hasContrast;
}

- (double)nextChangeBarrier
{
  return self->_nextChangeBarrier;
}

@end