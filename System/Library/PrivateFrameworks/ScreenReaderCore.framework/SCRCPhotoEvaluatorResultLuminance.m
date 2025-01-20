@interface SCRCPhotoEvaluatorResultLuminance
- (SCRCPhotoEvaluatorResultLuminance)initWithDarknessLevel:(double)a3 brightnessLevel:(double)a4 averageLevel:(double)a5;
- (double)averageLevel;
- (double)brightnessLevel;
- (double)darknessLevel;
- (id)humanReadableResult;
@end

@implementation SCRCPhotoEvaluatorResultLuminance

- (SCRCPhotoEvaluatorResultLuminance)initWithDarknessLevel:(double)a3 brightnessLevel:(double)a4 averageLevel:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SCRCPhotoEvaluatorResultLuminance;
  v8 = [(SCRCPhotoEvaluatorResultLuminance *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_darknessLevel = a3;
    v8->_brightnessLevel = a4;
    v8->_averageLevel = a5;
    v10 = v8;
  }

  return v9;
}

- (id)humanReadableResult
{
  double darknessLevel = self->_darknessLevel;
  if (darknessLevel <= 0.85)
  {
    if (darknessLevel <= 0.6)
    {
      double brightnessLevel = self->_brightnessLevel;
      if (brightnessLevel <= 0.85)
      {
        v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v4 = v3;
        if (brightnessLevel <= 0.6) {
          v5 = @"well_lit";
        }
        else {
          v5 = @"bright";
        }
      }
      else
      {
        v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v4 = v3;
        v5 = @"very_bright";
      }
    }
    else
    {
      v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v4 = v3;
      v5 = @"dark";
    }
  }
  else
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    v5 = @"very_dark";
  }
  v7 = [v3 localizedStringForKey:v5 value:&stru_26CC25790 table:@"PhotoEvaluationStrings"];

  return v7;
}

- (double)darknessLevel
{
  return self->_darknessLevel;
}

- (double)brightnessLevel
{
  return self->_brightnessLevel;
}

- (double)averageLevel
{
  return self->_averageLevel;
}

@end