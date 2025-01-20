@interface _UIFeedbackStateChangeConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)hidThresholdFeedbackPatternName;
- (_UIFeedbackContinuousPlayable)approachFeedback;
- (_UIFeedbackDiscretePlayable)thresholdFeedback;
- (double)approachCurvature;
- (double)approachEnd;
- (double)approachStart;
- (double)approachVolumeMax;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setApproachCurvature:(double)a3;
- (void)setApproachEnd:(double)a3;
- (void)setApproachFeedback:(id)a3;
- (void)setApproachStart:(double)a3;
- (void)setApproachVolumeMax:(double)a3;
- (void)setHidThresholdFeedbackPatternName:(id)a3;
- (void)setThresholdFeedback:(id)a3;
@end

@implementation _UIFeedbackStateChangeConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(_UIFeedbackDiscretePlayable *)self->_thresholdFeedback copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(_UIFeedbackContinuousPlayable *)self->_approachFeedback copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  v4[3] = *(void *)&self->_approachStart;
  v4[4] = *(void *)&self->_approachEnd;
  v4[5] = *(void *)&self->_approachCurvature;
  v4[6] = *(void *)&self->_approachVolumeMax;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIFeedbackStateChangeConfiguration;
  if ([(_UIFeedbackStateChangeConfiguration *)&v16 isEqual:v4])
  {
    uint64_t v5 = (double *)v4;
    v6 = (void *)*((void *)v5 + 1);
    uint64_t v7 = self->_thresholdFeedback;
    v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      if (!v7 || !v8) {
        goto LABEL_14;
      }
      int v10 = [(_UIFeedbackDiscretePlayable *)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_15;
      }
    }
    v12 = (void *)*((void *)v5 + 2);
    uint64_t v7 = self->_approachFeedback;
    v13 = v12;
    if (v7 == v13)
    {

LABEL_19:
      if (self->_approachStart == v5[3] && self->_approachEnd == v5[4] && self->_approachCurvature == v5[5])
      {
        BOOL v11 = self->_approachVolumeMax == v5[6];
        goto LABEL_16;
      }
LABEL_15:
      BOOL v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v9 = v13;
    if (v7 && v13)
    {
      int v14 = [(_UIFeedbackDiscretePlayable *)v7 isEqual:v13];

      if (!v14) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

- (_UIFeedbackDiscretePlayable)thresholdFeedback
{
  return self->_thresholdFeedback;
}

- (void)setThresholdFeedback:(id)a3
{
}

- (_UIFeedbackContinuousPlayable)approachFeedback
{
  return self->_approachFeedback;
}

- (void)setApproachFeedback:(id)a3
{
}

- (double)approachStart
{
  return self->_approachStart;
}

- (void)setApproachStart:(double)a3
{
  self->_approachStart = a3;
}

- (double)approachEnd
{
  return self->_approachEnd;
}

- (void)setApproachEnd:(double)a3
{
  self->_approachEnd = a3;
}

- (double)approachCurvature
{
  return self->_approachCurvature;
}

- (void)setApproachCurvature:(double)a3
{
  self->_approachCurvature = a3;
}

- (double)approachVolumeMax
{
  return self->_approachVolumeMax;
}

- (void)setApproachVolumeMax:(double)a3
{
  self->_approachVolumeMax = a3;
}

- (NSString)hidThresholdFeedbackPatternName
{
  return self->_hidThresholdFeedbackPatternName;
}

- (void)setHidThresholdFeedbackPatternName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidThresholdFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_approachFeedback, 0);
  objc_storeStrong((id *)&self->_thresholdFeedback, 0);
}

@end