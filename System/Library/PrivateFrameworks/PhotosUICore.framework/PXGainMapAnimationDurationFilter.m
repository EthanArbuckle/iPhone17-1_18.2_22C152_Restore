@interface PXGainMapAnimationDurationFilter
- (BOOL)enabled;
- (BOOL)gainMapImageAvailable;
- (PXGainMapAnimationDurationFilter)init;
- (double)activationThreshold;
- (double)filterStartTime;
- (double)updatedOutput;
- (void)setActivationThreshold:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilterStartTime:(double)a3;
- (void)setGainMapImageAvailable:(BOOL)a3;
@end

@implementation PXGainMapAnimationDurationFilter

- (void)setActivationThreshold:(double)a3
{
  self->_activationThreshold = a3;
}

- (double)activationThreshold
{
  return self->_activationThreshold;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setFilterStartTime:(double)a3
{
  self->_filterStartTime = a3;
}

- (double)filterStartTime
{
  return self->_filterStartTime;
}

- (BOOL)gainMapImageAvailable
{
  return self->_gainMapImageAvailable;
}

- (double)updatedOutput
{
  if (![(PXGainMapAnimationDurationFilter *)self enabled]) {
    return 0.0;
  }
  if (![(PXGainMapAnimationDurationFilter *)self gainMapImageAvailable]) {
    return 0.0;
  }
  [(PXNumberFilter *)self currentTime];
  double v4 = v3;
  [(PXGainMapAnimationDurationFilter *)self filterStartTime];
  double v6 = v4 - v5;
  [(PXGainMapAnimationDurationFilter *)self activationThreshold];
  if (v6 <= v7) {
    return 0.0;
  }
  [(PXNumberFilter *)self input];
  return result;
}

- (void)setGainMapImageAvailable:(BOOL)a3
{
  if (self->_gainMapImageAvailable != a3)
  {
    self->_gainMapImageAvailable = a3;
    if (!a3)
    {
      [(PXNumberFilter *)self currentTime];
      -[PXGainMapAnimationDurationFilter setFilterStartTime:](self, "setFilterStartTime:");
    }
    [(PXNumberFilter *)self invalidateOutput];
  }
}

- (PXGainMapAnimationDurationFilter)init
{
  double v3 = +[PXImageModulationSettings sharedInstance];
  [v3 gainMapAnimationDuration];
  v9.receiver = self;
  v9.super_class = (Class)PXGainMapAnimationDurationFilter;
  double v4 = -[PXNumberFilter initWithInput:](&v9, sel_initWithInput_);
  double v5 = v4;
  if (v4)
  {
    [(PXNumberFilter *)v4 currentTime];
    v5->_filterStartTime = v6;
    v5->_enabled = [v3 animateGainMapAppearance];
    [v3 gainMapAnimationActivationThreshold];
    v5->_activationThreshold = v7;
  }

  return v5;
}

@end