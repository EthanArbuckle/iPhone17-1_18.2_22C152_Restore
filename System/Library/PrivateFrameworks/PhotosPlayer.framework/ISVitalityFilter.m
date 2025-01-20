@interface ISVitalityFilter
- (BOOL)_isPerformingInputChanges;
- (BOOL)_isPerformingOutputChanges;
- (BOOL)_outputDidChange;
- (BOOL)hasTargetVisibilityOffset;
- (BOOL)isDecelerating;
- (BOOL)isScrolling;
- (BOOL)isScrubbing;
- (BOOL)isVisible;
- (ISVitalityFilter)init;
- (ISVitalityFilter)initWithSettings:(id)a3;
- (ISVitalitySettings)settings;
- (NSDate)estimatedScrollEndDate;
- (double)playRate;
- (double)scrubOffset;
- (double)targetVisibilityOffset;
- (double)visibilityOffset;
- (id)outputChangeHandler;
- (void)_invalidateOutput;
- (void)_setOutputDidChange:(BOOL)a3;
- (void)_setPerformingInputChanges:(BOOL)a3;
- (void)_setPerformingOutputChanges:(BOOL)a3;
- (void)performInputChanges:(id)a3;
- (void)performOutputChanges:(id)a3;
- (void)setDecelerating:(BOOL)a3;
- (void)setEstimatedScrollEndDate:(id)a3;
- (void)setHasTargetVisibilityOffset:(BOOL)a3;
- (void)setOutputChangeHandler:(id)a3;
- (void)setPlayRate:(double)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setScrubOffset:(double)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setTargetVisibilityOffset:(double)a3;
- (void)setVisibilityOffset:(double)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation ISVitalityFilter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputChangeHandler, 0);
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_setOutputDidChange:(BOOL)a3
{
  self->__outputDidChange = a3;
}

- (BOOL)_outputDidChange
{
  return self->__outputDidChange;
}

- (void)_setPerformingOutputChanges:(BOOL)a3
{
  self->__isPerformingOutputChanges = a3;
}

- (BOOL)_isPerformingOutputChanges
{
  return self->__isPerformingOutputChanges;
}

- (void)_setPerformingInputChanges:(BOOL)a3
{
  self->__isPerformingInputChanges = a3;
}

- (BOOL)_isPerformingInputChanges
{
  return self->__isPerformingInputChanges;
}

- (void)setOutputChangeHandler:(id)a3
{
}

- (id)outputChangeHandler
{
  return self->_outputChangeHandler;
}

- (double)playRate
{
  return self->_playRate;
}

- (double)scrubOffset
{
  return self->_scrubOffset;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
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

- (ISVitalitySettings)settings
{
  return self->_settings;
}

- (void)setPlayRate:(double)a3
{
  if (self->_playRate != a3)
  {
    self->_playRate = a3;
    [(ISVitalityFilter *)self _invalidateOutput];
  }
}

- (void)setScrubOffset:(double)a3
{
  if (self->_scrubOffset != a3)
  {
    self->_scrubOffset = a3;
    [(ISVitalityFilter *)self _invalidateOutput];
  }
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    [(ISVitalityFilter *)self _invalidateOutput];
  }
}

- (void)setDecelerating:(BOOL)a3
{
  if (self->_isDecelerating != a3) {
    self->_isDecelerating = a3;
  }
}

- (void)setScrolling:(BOOL)a3
{
  if (self->_isScrolling != a3) {
    self->_isScrolling = a3;
  }
}

- (void)setEstimatedScrollEndDate:(id)a3
{
  v5 = (NSDate *)a3;
  estimatedScrollEndDate = self->_estimatedScrollEndDate;
  p_estimatedScrollEndDate = &self->_estimatedScrollEndDate;
  if (estimatedScrollEndDate != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_estimatedScrollEndDate, a3);
    v5 = v8;
  }
}

- (void)setTargetVisibilityOffset:(double)a3
{
  if (self->_targetVisibilityOffset != a3) {
    self->_targetVisibilityOffset = a3;
  }
}

- (void)setHasTargetVisibilityOffset:(BOOL)a3
{
  if (self->_hasTargetVisibilityOffset != a3) {
    self->_hasTargetVisibilityOffset = a3;
  }
}

- (void)setVisibilityOffset:(double)a3
{
  if (self->_visibilityOffset != a3) {
    self->_visibilityOffset = a3;
  }
}

- (void)setVisible:(BOOL)a3
{
  if (self->_isVisible != a3) {
    self->_isVisible = a3;
  }
}

- (void)_invalidateOutput
{
}

- (void)performOutputChanges:(id)a3
{
  v7 = (void (**)(void))a3;
  BOOL v4 = [(ISVitalityFilter *)self _isPerformingOutputChanges];
  [(ISVitalityFilter *)self _setPerformingOutputChanges:1];
  if (v7) {
    v7[2](v7);
  }
  [(ISVitalityFilter *)self _setPerformingOutputChanges:v4];
  if (!v4 && [(ISVitalityFilter *)self _outputDidChange])
  {
    [(ISVitalityFilter *)self _setOutputDidChange:0];
    uint64_t v5 = [(ISVitalityFilter *)self outputChangeHandler];
    v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, ISVitalityFilter *))(v5 + 16))(v5, self);
    }
  }
}

- (void)performInputChanges:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  BOOL v4 = [(ISVitalityFilter *)self _isPerformingInputChanges];
  [(ISVitalityFilter *)self _setPerformingInputChanges:1];
  if (v5) {
    v5[2](v5);
  }
  [(ISVitalityFilter *)self _setPerformingInputChanges:v4];
  if (!v4) {
    [(ISVitalityFilter *)self inputDidChange];
  }
}

- (ISVitalityFilter)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISVitalityFilter;
  v6 = [(ISVitalityFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_settings, a3);
  }

  return v7;
}

- (ISVitalityFilter)init
{
  return [(ISVitalityFilter *)self initWithSettings:0];
}

@end