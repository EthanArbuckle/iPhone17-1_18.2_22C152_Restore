@interface ISLivePhotoAutoplayVitalityFilter
- (BOOL)hasTargetVisibilityOffset;
- (BOOL)isDecelerating;
- (BOOL)isScrolling;
- (BOOL)isVisible;
- (NSDate)estimatedScrollEndDate;
- (double)targetVisibilityOffset;
- (double)visibilityOffset;
- (int64_t)_state;
- (void)_setState:(int64_t)a3;
- (void)setDecelerating:(BOOL)a3;
- (void)setEstimatedScrollEndDate:(id)a3;
- (void)setHasTargetVisibilityOffset:(BOOL)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setTargetVisibilityOffset:(double)a3;
- (void)setVisibilityOffset:(double)a3;
- (void)setVisible:(BOOL)a3;
- (void)updateOutput;
@end

@implementation ISLivePhotoAutoplayVitalityFilter

- (void).cxx_destruct
{
}

- (int64_t)_state
{
  return self->__state;
}

- (BOOL)isDecelerating
{
  return self->_isDecelerating;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (NSDate)estimatedScrollEndDate
{
  return self->_estimatedScrollEndDate;
}

- (double)targetVisibilityOffset
{
  return self->_targetVisibilityOffset;
}

- (BOOL)hasTargetVisibilityOffset
{
  return self->_hasTargetVisibilityOffset;
}

- (double)visibilityOffset
{
  return self->_visibilityOffset;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)_setState:(int64_t)a3
{
  int64_t state = self->__state;
  if (state != a3)
  {
    self->__int64_t state = a3;
    if ((unint64_t)a3 >= 2)
    {
      if (a3 != 2 || state != 1) {
        return;
      }
      a3 = 2;
    }
    [(ISLivePhotoVitalityFilter *)self setState:a3];
  }
}

- (void)updateOutput
{
  v15.receiver = self;
  v15.super_class = (Class)ISLivePhotoAutoplayVitalityFilter;
  [(ISLivePhotoVitalityFilter *)&v15 updateOutput];
  BOOL v3 = [(ISLivePhotoAutoplayVitalityFilter *)self isScrolling];
  BOOL v4 = [(ISLivePhotoAutoplayVitalityFilter *)self isVisible];
  BOOL v5 = v4;
  if (!v3 && v4) {
    [(ISLivePhotoAutoplayVitalityFilter *)self _setState:0];
  }
  if (!v5)
  {
    uint64_t v9 = 1;
LABEL_19:
    [(ISLivePhotoAutoplayVitalityFilter *)self _setState:v9];
    return;
  }
  BOOL v6 = [(ISLivePhotoAutoplayVitalityFilter *)self isDecelerating];
  int v7 = v3 && !v6;
  if ([(ISLivePhotoAutoplayVitalityFilter *)self _state] == 1 && (v7 & 1) == 0)
  {
    if (v6 && [(ISLivePhotoAutoplayVitalityFilter *)self hasTargetVisibilityOffset]) {
      [(ISLivePhotoAutoplayVitalityFilter *)self targetVisibilityOffset];
    }
    else {
      [(ISLivePhotoAutoplayVitalityFilter *)self visibilityOffset];
    }
    double v10 = fmin(fabs(v8), 1.0);
    v11 = [(ISLivePhotoVitalityFilter *)self settings];
    [v11 minimumVisibilityFactor];
    double v13 = 1.0 - v12;

    if (v10 < v13) {
      [(ISLivePhotoAutoplayVitalityFilter *)self _setState:2];
    }
  }
  if ([(ISLivePhotoAutoplayVitalityFilter *)self _state]) {
    int v14 = 1;
  }
  else {
    int v14 = v3;
  }
  if (((v14 | v6 | v7) & 1) == 0)
  {
    uint64_t v9 = 2;
    goto LABEL_19;
  }
}

- (void)setVisible:(BOOL)a3
{
  self->_isVisible = a3;
  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

- (void)setVisibilityOffset:(double)a3
{
  self->_visibilityOffset = a3;
  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

- (void)setHasTargetVisibilityOffset:(BOOL)a3
{
  self->_hasTargetVisibilityOffset = a3;
  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

- (void)setTargetVisibilityOffset:(double)a3
{
  self->_targetVisibilityOffset = a3;
  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

- (void)setDecelerating:(BOOL)a3
{
  self->_isDecelerating = a3;
  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

- (void)setEstimatedScrollEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, a3);

  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

- (void)setScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
  [(ISLivePhotoVitalityFilter *)self invalidateOutput];
}

@end