@interface SCRCPhotoEvaluatorResultBlur
- (SCRCPhotoEvaluatorResultBlur)initWithBlurLevel:(double)a3;
- (double)blurLevel;
- (id)humanReadableResult;
@end

@implementation SCRCPhotoEvaluatorResultBlur

- (SCRCPhotoEvaluatorResultBlur)initWithBlurLevel:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCRCPhotoEvaluatorResultBlur;
  v4 = [(SCRCPhotoEvaluatorResultBlur *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_blurLevel = a3;
    v6 = v4;
  }

  return v5;
}

- (id)humanReadableResult
{
  double blurLevel = self->_blurLevel;
  if (blurLevel <= 0.9)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    if (blurLevel <= 0.75) {
      v5 = @"crisp";
    }
    else {
      v5 = @"blurry";
    }
  }
  else
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    v5 = @"very_blurry";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_26CC25790 table:@"PhotoEvaluationStrings"];

  return v6;
}

- (double)blurLevel
{
  return self->_blurLevel;
}

@end