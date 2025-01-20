@interface CHDValueAxis
- (BOOL)isAutoMajorUnitValue;
- (BOOL)isAutoMinorUnitValue;
- (BOOL)isPercentageFormattingFlag;
- (BOOL)isShowBuiltInUnit;
- (CHDValueAxis)initWithResources:(id)a3;
- (double)majorUnitValue;
- (double)minorUnitValue;
- (double)scalingLogBase;
- (id)contentFormatWithBuiltInUnit;
- (int)builtInUnit;
- (void)adjustAxisPositionForHorizontalChart;
- (void)setBuiltInUnit:(int)a3;
- (void)setMajorUnitValue:(double)a3;
- (void)setMinorUnitValue:(double)a3;
- (void)setPercentageFormattingFlag:(BOOL)a3;
- (void)setScalingLogBase:(double)a3;
- (void)setShowBuiltInUnitFlag:(BOOL)a3;
@end

@implementation CHDValueAxis

- (CHDValueAxis)initWithResources:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDValueAxis;
  result = [(CHDAxis *)&v4 initWithResources:a3];
  if (result)
  {
    result->mMajorUnitValue = 0.0;
    result->mMinorUnitValue = 0.0;
    result->mScalingLogBase = 0.0;
    result->super.mAxisPosition = 1;
    result->mPercentageFormattingFlag = 0;
    result->mAutoMajorUnitValue = 1;
    result->mAutoMinorUnitValue = 1;
    result->mShowBuiltInUnit = 0;
    result->mBuiltInUnit = -1;
  }
  return result;
}

- (BOOL)isPercentageFormattingFlag
{
  return self->mPercentageFormattingFlag;
}

- (void)setPercentageFormattingFlag:(BOOL)a3
{
  self->mPercentageFormattingFlag = a3;
}

- (void)setMajorUnitValue:(double)a3
{
  self->mMajorUnitValue = a3;
  self->mAutoMajorUnitValue = 0;
}

- (void)adjustAxisPositionForHorizontalChart
{
  self->super.mAxisPosition = 0;
}

- (void)setMinorUnitValue:(double)a3
{
  self->mMinorUnitValue = a3;
  self->mAutoMinorUnitValue = 0;
}

- (void)setScalingLogBase:(double)a3
{
  self->mScalingLogBase = a3;
}

- (double)majorUnitValue
{
  return self->mMajorUnitValue;
}

- (double)minorUnitValue
{
  return self->mMinorUnitValue;
}

- (double)scalingLogBase
{
  return self->mScalingLogBase;
}

- (BOOL)isAutoMajorUnitValue
{
  return self->mAutoMajorUnitValue;
}

- (BOOL)isAutoMinorUnitValue
{
  return self->mAutoMinorUnitValue;
}

- (BOOL)isShowBuiltInUnit
{
  return self->mShowBuiltInUnit;
}

- (void)setShowBuiltInUnitFlag:(BOOL)a3
{
  self->mShowBuiltInUnit = a3;
}

- (int)builtInUnit
{
  return self->mBuiltInUnit;
}

- (void)setBuiltInUnit:(int)a3
{
  self->mBuiltInUnit = a3;
}

- (id)contentFormatWithBuiltInUnit
{
  unsigned int mBuiltInUnit = self->mBuiltInUnit;
  BOOL v3 = mBuiltInUnit > 8;
  int v4 = (1 << mBuiltInUnit) & 0x192;
  if (v3 || v4 == 0)
  {
    v15 = 0;
  }
  else
  {
    v7 = [(CHDAxis *)self contentFormat];
    v8 = [v7 formatString];

    if (v8)
    {
      v9 = [v7 formatString];
      v10 = [v9 string];

      if (v10 && [v10 length] && (uint64_t v11 = objc_msgSend(v10, "length"), v11 - 1 >= 0))
      {
        int v12 = 0;
        while (1)
        {
          uint64_t v13 = v11 - 1;
          v14 = objc_msgSend(v10, "substringWithRange:", v11 - 1, 1);
          v12 ^= [v14 isEqualToString:@"'"];
          if ((v12 & 1) == 0
            && (([v14 isEqualToString:@"#"] & 1) != 0
             || ([v14 isEqualToString:@"0"] & 1) != 0
             || ([v14 isEqualToString:@"?"] & 1) != 0
             || [v14 isEqualToString:@"."]))
          {
            break;
          }

          --v11;
          if (v13 <= 0) {
            goto LABEL_16;
          }
        }
        v17 = (void *)MEMORY[0x263F089D8];
        v18 = [v10 substringToIndex:v11];
        v19 = [v17 stringWithString:v18];

        unsigned int v20 = self->mBuiltInUnit - 1;
        if (v20 < 8 && ((0xC9u >> v20) & 1) != 0)
        {
          [v19 appendString:off_264D67C58[v20]];
          char v21 = 1;
        }
        else
        {
          char v21 = 0;
        }
        v22 = [v10 substringFromIndex:v11];
        [v19 appendString:v22];

        uint64_t v23 = [NSString stringWithString:v19];

        if (v21)
        {
          v24 = +[EDString edStringWithString:v23];
          v25 = +[EDContentFormat contentFormatWithFormatString:v24];

          id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
          v27 = [WeakRetained contentFormats];

          v15 = objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v27, "addOrEquivalentObject:", v25));
        }
        else
        {
          v15 = 0;
        }
        v10 = (void *)v23;
      }
      else
      {
LABEL_16:
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  return v15;
}

@end