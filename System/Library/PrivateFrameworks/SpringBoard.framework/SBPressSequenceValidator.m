@interface SBPressSequenceValidator
- (BOOL)pressEventIsValidInSequence:(id)a3 endingDownEvent:(BOOL)a4 duration:(double)a5;
- (SBPressSequenceSettings)settings;
- (SBPressSequenceValidator)init;
- (SBPressSequenceValidator)initWithSettings:(id)a3;
- (_SBPressSequenceValidatorBounds)_pressDownBoundsForDesiredIndex:(unint64_t)a3 sequence:(id)a4;
- (_SBPressSequenceValidatorBounds)_pressUpBoundsForDesiredIndex:(unint64_t)a3 sequence:(id)a4;
- (double)timeUntilNextPressEventIsInValidInSequence:(id)a3 lastPressEventInSequenceIsDown:(BOOL)a4;
- (int64_t)_modeForDesiredIndex:(unint64_t)a3 isDownEvent:(BOOL)a4;
@end

@implementation SBPressSequenceValidator

- (SBPressSequenceValidator)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBPressSequenceValidator.m" lineNumber:53 description:@"Use initWithSettings:"];

  return [(SBPressSequenceValidator *)self initWithSettings:0];
}

- (SBPressSequenceValidator)initWithSettings:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBPressSequenceValidator.m" lineNumber:58 description:@"SBPressSequenceValidator must be given non nil settings"];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBPressSequenceValidator;
  v7 = [(SBPressSequenceValidator *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_settings, a3);
  }

  return v8;
}

- (BOOL)pressEventIsValidInSequence:(id)a3 endingDownEvent:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [v9 count];
  uint64_t v11 = v10;
  if (v6)
  {
    [(SBPressSequenceValidator *)self _pressDownBoundsForDesiredIndex:v10 sequence:v9];
    if (v12 <= a5 && v13 >= a5)
    {
LABEL_18:
      BOOL v24 = 1;
      goto LABEL_19;
    }
    double v15 = v12;
    double v16 = v13;
    v17 = SBLogButtonsCombo();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v27 = 134218496;
      double v28 = a5;
      __int16 v29 = 2048;
      double v30 = v15;
      __int16 v31 = 2048;
      double v32 = v16;
      v18 = "down press duration:%g out of bounds (%g - %g)";
LABEL_21:
      _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v27, 0x20u);
    }
  }
  else
  {
    if (!v10)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"SBPressSequenceValidator.m" lineNumber:79 description:@"SBPressSequence asked to evaluate an up event with no down event present in the sequence"];
    }
    -[SBPressSequenceValidator _pressUpBoundsForDesiredIndex:sequence:](self, "_pressUpBoundsForDesiredIndex:sequence:", objc_msgSend(v9, "count", v11) - 1, v9);
    if (v19 <= a5 && v20 >= a5) {
      goto LABEL_18;
    }
    double v22 = v19;
    double v23 = v20;
    v17 = SBLogButtonsCombo();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v27 = 134218496;
      double v28 = a5;
      __int16 v29 = 2048;
      double v30 = v22;
      __int16 v31 = 2048;
      double v32 = v23;
      v18 = "up press duration:%g out of bounds (%g - %g)";
      goto LABEL_21;
    }
  }

  BOOL v24 = 0;
LABEL_19:

  return v24;
}

- (double)timeUntilNextPressEventIsInValidInSequence:(id)a3 lastPressEventInSequenceIsDown:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v4) {
    [(SBPressSequenceValidator *)self _pressUpBoundsForDesiredIndex:v7 - 1 sequence:v6];
  }
  else {
    [(SBPressSequenceValidator *)self _pressDownBoundsForDesiredIndex:v7 sequence:v6];
  }
  double v9 = v8;

  return v9;
}

- (_SBPressSequenceValidatorBounds)_pressDownBoundsForDesiredIndex:(unint64_t)a3 sequence:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [(SBPressSequenceValidator *)self _modeForDesiredIndex:a3 isDownEvent:1];
  if ([(SBPressSequenceSettings *)self->_settings indexOfPressDownToUseForVarianceAndGrowth] >= a3)
  {
    double v8 = 0;
  }
  else
  {
    double v8 = objc_msgSend(v6, "objectAtIndex:", -[SBPressSequenceSettings indexOfPressDownToUseForVarianceAndGrowth](self->_settings, "indexOfPressDownToUseForVarianceAndGrowth"));
  }
  if (v7 == 2)
  {
    [v8 durationDown];
    double v13 = v12;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      double v18 = v13;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "durationDown", (void)v29);
          if (v18 >= v20) {
            double v18 = v20;
          }
          if (v13 < v20) {
            double v13 = v20;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = v13;
    }

    [(SBPressSequenceSettings *)self->_settings pressDownVariance];
    double v9 = v18 - v25;
    goto LABEL_24;
  }
  if (v7 == 1)
  {
    [v8 durationDown];
    double v22 = v21;
    [(SBPressSequenceSettings *)self->_settings pressDownVariance];
    double v9 = v22 - v23;
    [v8 durationDown];
    double v13 = v24;
LABEL_24:
    [(SBPressSequenceSettings *)self->_settings pressDownVariance];
    double v11 = v13 + v26;
    goto LABEL_25;
  }
  double v9 = 0.0;
  if (v7)
  {
    double v11 = 0.0;
  }
  else
  {
    [(SBPressSequenceSettings *)self->_settings maxDefaultPressDownDuration];
    double v11 = v10;
  }
LABEL_25:

  double v27 = v9;
  double v28 = v11;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

- (_SBPressSequenceValidatorBounds)_pressUpBoundsForDesiredIndex:(unint64_t)a3 sequence:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = [(SBPressSequenceValidator *)self _modeForDesiredIndex:a3 isDownEvent:0];
  if ([(SBPressSequenceSettings *)self->_settings indexOfPressUpToUseForVarianceAndGrowth] >= a3)
  {
    double v8 = 0;
  }
  else
  {
    double v8 = objc_msgSend(v6, "objectAtIndex:", -[SBPressSequenceSettings indexOfPressUpToUseForVarianceAndGrowth](self->_settings, "indexOfPressUpToUseForVarianceAndGrowth"));
  }
  if (v7 == 2)
  {
    [v8 durationUp];
    double v18 = v17;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      double v23 = v18;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          double v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          double v26 = objc_msgSend(v19, "lastObject", (void)v36);

          if (v25 != v26)
          {
            [v25 durationUp];
            if (v23 >= v27) {
              double v23 = v27;
            }
            if (v18 < v27) {
              double v18 = v27;
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v21);
    }
    else
    {
      double v23 = v18;
    }

    [(SBPressSequenceSettings *)self->_settings pressUpVariance];
    double v9 = v23 - v32;
    goto LABEL_30;
  }
  if (v7 == 1)
  {
    [v8 durationUp];
    double v29 = v28;
    [(SBPressSequenceSettings *)self->_settings pressUpVariance];
    double v9 = v29 - v30;
    [v8 durationUp];
    double v18 = v31;
LABEL_30:
    [(SBPressSequenceSettings *)self->_settings pressUpVariance];
    double v11 = v18 + v33;
    goto LABEL_31;
  }
  double v9 = 0.0;
  if (v7)
  {
    double v11 = 0.0;
  }
  else
  {
    [(SBPressSequenceSettings *)self->_settings maxDefaultPressUpDuration];
    double v11 = v10;
    [(SBPressSequenceSettings *)self->_settings maxDownToDownDuration];
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      double v12 = 0.0;
      if ([v6 count] > a3)
      {
        double v13 = [v6 objectAtIndex:a3];
        [v13 durationDown];
        double v12 = v14;
      }
      [(SBPressSequenceSettings *)self->_settings maxDownToDownDuration];
      double v16 = v15 - v12;
      if (v11 >= v16) {
        double v11 = v16;
      }
    }
  }
LABEL_31:

  double v34 = v9;
  double v35 = v11;
  result.var1 = v35;
  result.var0 = v34;
  return result;
}

- (int64_t)_modeForDesiredIndex:(unint64_t)a3 isDownEvent:(BOOL)a4
{
  BOOL v4 = a4;
  settings = self->_settings;
  if (a4)
  {
    unint64_t v9 = [(SBPressSequenceSettings *)settings indexOfPressDownToUseForVarianceAndGrowth];
    unint64_t v10 = [(SBPressSequenceSettings *)self->_settings numberOfPressDownGrowthTerms];
  }
  else
  {
    unint64_t v9 = [(SBPressSequenceSettings *)settings indexOfPressUpToUseForVarianceAndGrowth];
    unint64_t v10 = [(SBPressSequenceSettings *)self->_settings numberOfPressUpGrowthTerms];
  }
  uint64_t v11 = v4 - 1;
  if (v9 < a3)
  {
    unint64_t v13 = v11 - v10;
    BOOL v12 = v11 - v10 + [(SBPressSequenceSettings *)self->_settings numberOfPresses] > a3;
    int v14 = 1;
  }
  else
  {
    BOOL v12 = 0;
    unint64_t v13 = v11 - v10;
    int v14 = 2;
  }
  BOOL v15 = v9 >= a3;
  unint64_t v16 = v13 + [(SBPressSequenceSettings *)self->_settings numberOfPresses];
  if (v12) {
    int v17 = v14;
  }
  else {
    int v17 = v15;
  }
  if (v16 > a3) {
    int v18 = 0;
  }
  else {
    int v18 = -1;
  }
  if (v17 == v18)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBPressSequenceValidator.m", 215, @"SBPressSequenceValidator found 0 validations when it should have found at least 1", 0);
  }
  if (v16 > a3) {
    return v12;
  }
  else {
    return 2;
  }
}

- (SBPressSequenceSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
}

@end