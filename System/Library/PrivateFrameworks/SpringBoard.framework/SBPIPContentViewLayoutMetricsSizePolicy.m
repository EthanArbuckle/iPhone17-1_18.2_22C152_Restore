@interface SBPIPContentViewLayoutMetricsSizePolicy
- (SBPIPContentViewLayoutMetricsSizePolicy)initWithSizePreferencesForLandscape:(id)a3 portrait:(id)a4 square:(id)a5;
- (id)sizePreferencesForAspectRatio:(double)a3;
@end

@implementation SBPIPContentViewLayoutMetricsSizePolicy

- (SBPIPContentViewLayoutMetricsSizePolicy)initWithSizePreferencesForLandscape:(id)a3 portrait:(id)a4 square:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10 && !v11 && !v12)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBPIPContentViewLayoutMetrics.m", 102, @"Invalid parameter not satisfying: %@", @"landscapeSizePref != nil || portraitSizePref != nil || squareSizePref != nil" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)SBPIPContentViewLayoutMetricsSizePolicy;
  v14 = [(SBPIPContentViewLayoutMetricsSizePolicy *)&v25 init];
  if (v14)
  {
    v15 = +[SBPIPSettingsDomain rootSettings];
    v16 = [v15 sizingSettings];

    [v16 landcapeAspectRatioClosedIntervalLowerBound];
    v14->_landscapeAspectRatioInterval.minimum = v17;
    [v16 landcapeAspectRatioClosedIntervalUpperBound];
    v14->_landscapeAspectRatioInterval.maximum = v18;
    [v16 squareAspectRatioClosedIntervalLowerBound];
    v14->_squareAspectRatioInterval.minimum = v19;
    [v16 squareAspectRatioClosedIntervalUpperBound];
    v14->_squareAspectRatioInterval.maximum = v20;
    [v16 portraitAspectRatioClosedIntervalLowerBound];
    v14->_portraitAspectRatioInterval.minimum = v21;
    [v16 portraitAspectRatioClosedIntervalUpperBound];
    v14->_portraitAspectRatioInterval.maximum = v22;
    objc_storeStrong((id *)&v14->_landscapeSizePref, a3);
    objc_storeStrong((id *)&v14->_portraitSizePref, a4);
    objc_storeStrong((id *)&v14->_squareSizePref, a5);
  }
  return v14;
}

- (id)sizePreferencesForAspectRatio:(double)a3
{
  p_landscapeSizePref = &self->_landscapeSizePref;
  if (self->_landscapeSizePref
    && BSFloatGreaterThanOrEqualToFloat()
    && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    goto LABEL_25;
  }
  p_portraitSizePref = (id *)&self->_portraitSizePref;
  if (self->_portraitSizePref
    && BSFloatGreaterThanOrEqualToFloat()
    && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    p_landscapeSizePref = &self->_portraitSizePref;
LABEL_25:
    id v7 = *p_landscapeSizePref;
    goto LABEL_26;
  }
  p_squareSizePref = &self->_squareSizePref;
  if (self->_squareSizePref
    && BSFloatGreaterThanOrEqualToFloat()
    && (BSFloatLessThanOrEqualToFloat() & 1) != 0)
  {
    p_landscapeSizePref = &self->_squareSizePref;
    goto LABEL_25;
  }
  id v7 = *p_landscapeSizePref;
  if (*p_landscapeSizePref)
  {
    if (self->_portraitSizePref)
    {
      if (!BSFloatLessThanOrEqualToFloat()) {
        p_landscapeSizePref = &self->_portraitSizePref;
      }
    }
    else
    {
      if (!*p_squareSizePref) {
        goto LABEL_26;
      }
      if (!BSFloatLessThanOrEqualToFloat()) {
        p_landscapeSizePref = &self->_squareSizePref;
      }
    }
    goto LABEL_25;
  }
  id v7 = *p_squareSizePref;
  if (!*p_portraitSizePref) {
    goto LABEL_26;
  }
  if (v7)
  {
    [*p_portraitSizePref shortSideMinimumSize];
    if (BSFloatLessThanOrEqualToFloat()) {
      p_landscapeSizePref = &self->_portraitSizePref;
    }
    else {
      p_landscapeSizePref = &self->_squareSizePref;
    }
    goto LABEL_25;
  }
  id v7 = *p_portraitSizePref;
LABEL_26:
  id v8 = v7;
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_squareSizePref, 0);
  objc_storeStrong((id *)&self->_portraitSizePref, 0);
  objc_storeStrong((id *)&self->_landscapeSizePref, 0);
}

@end