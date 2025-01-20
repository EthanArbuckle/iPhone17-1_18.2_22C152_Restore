@interface _UIPageControlInteractor
- (_UIHyperInteractor)interactor;
- (_UIPageControlInteractor)initWithMaximumDistance:(double)a3;
- (double)boundedScrubPosition;
- (double)hyperConstrainedPosition;
- (double)joggingDistance;
- (double)unboundedScrubPosition;
- (double)unconstrainedPosition;
- (void)commitTranslation;
- (void)reduceScrubOffsetByOffset:(double)a3;
- (void)reduceScrubOffsetByRatio:(double)a3;
- (void)setInteractor:(id)a3;
- (void)setTranslation:(double)a3 velocity:(double)a4;
- (void)setUnconstrainedPosition:(double)a3 offset:(double)a4;
- (void)updateRubberbandLowerBound:(double)a3 upperBound:(double)a4;
- (void)updateScrubLowerBound:(double)a3 upperBound:(double)a4;
@end

@implementation _UIPageControlInteractor

- (void)updateScrubLowerBound:(double)a3 upperBound:(double)a4
{
  self->_lowerBound = a3;
  self->_upperBound = a4;
}

- (_UIPageControlInteractor)initWithMaximumDistance:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UIPageControlInteractor;
  v4 = [(_UIPageControlInteractor *)&v11 init];
  if (v4)
  {
    v5 = [[_UIHyperConstantExtender alloc] initWithDimensions:1];
    [(_UIHyperConstantExtender *)v5 _setMaximumDistance:a3];
    v6 = [[_UIHyperInteractor alloc] initWithDimensions:1];
    [(_UIPageControlInteractor *)v4 setInteractor:v6];

    v7 = [[_UIHyperrectangle alloc] initWithDimensions:1];
    v8 = [(_UIPageControlInteractor *)v4 interactor];
    [v8 _setRegion:v7];

    v9 = [(_UIPageControlInteractor *)v4 interactor];
    [v9 _setExtender:v5];
  }
  return v4;
}

- (void)setInteractor:(id)a3
{
}

- (void)setUnconstrainedPosition:(double)a3 offset:(double)a4
{
  double v7 = a3;
  v6 = [(_UIPageControlInteractor *)self interactor];
  [v6 _copyUnconstrainedPoint:&v7];

  self->_scrubbingOffset = a4;
}

- (double)joggingDistance
{
  v3 = [(_UIPageControlInteractor *)self interactor];
  double v4 = *(double *)[v3 _constrainedPoint];
  v5 = [(_UIPageControlInteractor *)self interactor];
  double v6 = v4 - *(double *)[v5 _closestPoint];

  return v6;
}

- (_UIHyperInteractor)interactor
{
  return self->_interactor;
}

- (void)updateRubberbandLowerBound:(double)a3 upperBound:(double)a4
{
  double v6 = [(_UIPageControlInteractor *)self interactor];
  double v7 = [v6 _region];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66___UIPageControlInteractor_updateRubberbandLowerBound_upperBound___block_invoke;
  v9[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v9[4] = a3;
  [v7 _mutateMinimumPoint:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66___UIPageControlInteractor_updateRubberbandLowerBound_upperBound___block_invoke_2;
  v8[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v8[4] = a4;
  [v7 _mutateMaximumPoint:v8];
}

- (double)unconstrainedPosition
{
  v2 = [(_UIPageControlInteractor *)self interactor];
  double v3 = *(double *)[v2 _translatedUnconstrainedPoint];

  return v3;
}

- (double)hyperConstrainedPosition
{
  v2 = [(_UIPageControlInteractor *)self interactor];
  double v3 = *(double *)[v2 _constrainedPoint];

  return v3;
}

- (double)boundedScrubPosition
{
  double lowerBound = self->_lowerBound;
  [(_UIPageControlInteractor *)self unboundedScrubPosition];
  return fmax(lowerBound, fmin(v4, self->_upperBound));
}

- (double)unboundedScrubPosition
{
  [(_UIPageControlInteractor *)self unconstrainedPosition];
  return v3 + self->_scrubbingOffset;
}

- (void)setTranslation:(double)a3 velocity:(double)a4
{
  v5 = [(_UIPageControlInteractor *)self interactor];
  [v5 _copyTranslation:&v15];

  double v6 = [(_UIPageControlInteractor *)self interactor];
  [v6 _copyVelocity:&v14];

  [(_UIPageControlInteractor *)self unboundedScrubPosition];
  double scrubbingOffset = self->_scrubbingOffset;
  if (scrubbingOffset < 0.0 && v7 < self->_lowerBound)
  {
    [(_UIPageControlInteractor *)self unconstrainedPosition];
    double v10 = self->_scrubbingOffset - (scrubbingOffset + v9 - self->_lowerBound);
    self->_double scrubbingOffset = v10;
    if (v10 <= 0.0) {
      return;
    }
LABEL_8:
    self->_double scrubbingOffset = 0.0;
    return;
  }
  if (scrubbingOffset > 0.0)
  {
    double upperBound = self->_upperBound;
    if (v7 > upperBound)
    {
      [(_UIPageControlInteractor *)self unconstrainedPosition];
      double v13 = self->_scrubbingOffset - (scrubbingOffset - (upperBound - v12));
      self->_double scrubbingOffset = v13;
      if (v13 < 0.0) {
        goto LABEL_8;
      }
    }
  }
}

- (void)commitTranslation
{
  id v2 = [(_UIPageControlInteractor *)self interactor];
  [v2 _commitTranslation];
}

- (void)reduceScrubOffsetByRatio:(double)a3
{
  self->_double scrubbingOffset = self->_scrubbingOffset / a3;
}

- (void)reduceScrubOffsetByOffset:(double)a3
{
  double scrubbingOffset = self->_scrubbingOffset;
  if (scrubbingOffset >= 0.0)
  {
    if (scrubbingOffset <= 0.0) {
      return;
    }
    double v4 = fmax(scrubbingOffset - a3, 0.0);
  }
  else
  {
    double v4 = fmin(scrubbingOffset + a3, 0.0);
  }
  self->_double scrubbingOffset = v4;
}

- (void).cxx_destruct
{
}

@end